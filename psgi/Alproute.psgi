use common::sense;
use Log::Log4perl;
use File::Basename;
use Plack::Builder;
use Plack::Middleware::WOAx::App;

use WOA::Config::Provider;
use Log::Log4perl;
use Template;
use Template::Provider::Encoding;
use Template::Stash::ForceUTF8;
use Plack::App::File;
use WOA::REST::ServiceProvider::Loader;
use Alproute::Page::View;
#use Alproute::RouteMap;

# use your app model classes

# define your app services classes

# define your app pages classes


my $app_root    = dirname(__FILE__).'/../';

my $config = WOA::Config::Provider->get_config($app_root.'/etc/Alproute.conf');
my $tpl = Template->new({
    INCLUDE_PATH => [
        $config->{template_root},
    ],
    TIMER               => 1,
    DEFAULT_ENCODING    => 'utf8',
});

Log::Log4perl::init($config->{log4perl});

#my $rules = Alproute::RouteMap->get_rules();

my $controller_param = {
    config              => $config,
    renderer            => $tpl
};

# create handlers for your services
#    my $rest = Plack::Middleware::WOAx::App->new({
#        service_provider    => 'ServiceProviderClassName',
#        %$controller_param
#    });

# create handlers for your pages
my $page = Plack::Middleware::WOAx::App->new({
    service_provider    => 'Alproute::Page::View',
    %$controller_param
});

#my $app = Plack::Middleware::WOAx::App->new({
#    service_provider =>  WOA::REST::ServiceProvider::Loader->new({rules=>$rules}),
#    %$controller_param
#});

builder {
    enable "Plack::Middleware::Static", path => qr{\.(i|js|css|html|png|gif|jpg)$}, root => "$app_root/public";
    enable "Plack::Middleware::AccessLog", format => "combined";
    enable "Plack::Middleware::ContentMD5";
    enable "Session",   store       => "File";
    # from $env->{'psgix.logger'}
    enable "Log4perl", category => "main";
        
    # mount pages
    #   mount "/any/path/to/page/method" => $page;
    
    # mount services
    #   mount "/any/path/to/service/method" => $rest;
    mount '/alproute/view' => $page;
    
    # or with dynamic mapping
    #foreach ( @{$rules} ) {
    #    mount $_->{path} => $app;    
    #}
    #$app;
};