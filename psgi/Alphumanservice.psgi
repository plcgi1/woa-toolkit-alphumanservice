use common::sense;
use Log::Log4perl;
use File::Basename;
use Plack::Builder;
use Plack::Middleware::WOAx::App;

use WOA::Config::Provider;
use Log::Log4perl;
use Text::Xslate;
use Text::Xslate::Bridge::TT2;
use Plack::App::File;
use Cache::FastMmap;
use WOA::REST::ServiceProvider::Loader;

use Alphumanservice::Model::DBIx;
use Alphumanservice::Formatter;
use Alphumanservice::RouteMap;

my $app_root    = dirname(__FILE__).'/../';

my $config = WOA::Config::Provider->get_config($app_root.'/etc/Alphumanservice.conf');
my $tpl = Text::Xslate->new(
    path        => $config->{template_root},
    #cache_dir   => $config->{template_cache},
    syntax      => 'TTerse',
    verbose => 2,
    module      => [qw(Text::Xslate::Bridge::TT2)],
);

Log::Log4perl::init($config->{log4perl});

my $fmt = Alphumanservice::Formatter->instance();
my $model = Alphumanservice::Model::DBIx->connect(
    $config->{connect_info}->[0],
    $config->{connect_info}->[1],
    $config->{connect_info}->[2],
    {
        on_connect_do => $config->{on_connect_do}
    }
);

my $fast_storage = Cache::FastMmap->new();

my $controller_param = {
    config              => $config,
    renderer            => $tpl,
    model               => $model,
    formatter           => $fmt ,
    fast_storage        => $fast_storage
};

my $rules = Alphumanservice::RouteMap->get_rules;
my $app = Plack::Middleware::WOAx::App->new({
    service_provider =>  WOA::REST::ServiceProvider::Loader->new({
        rules => $rules
    }),
    %$controller_param
});

builder {
    enable "Plack::Middleware::Static",  path => qr{\.(i|js|css|html|png|gif|ico|jpg|json|xml|txt)$}, root => "$app_root/public";
    enable "Plack::Middleware::AccessLog", format => "combined";
    enable "Plack::Middleware::ContentMD5";
    enable "Session",   store       => "File";
    
    # uncomment it if you need some state for all pages and request
    #enable "Plack::Middleware::WOAx::Project";
    
    # from $env->{'psgix.logger'}
    enable "Log4perl", category => "main";
        
    foreach ( @{$rules} ) {
        mount $_->{path} => $app;    
    }
    $app;
};