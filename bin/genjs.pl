#!/usr/bin/perl -w
use strict;
use FindBin qw/$Bin/;
use Getopt::Long;
use Pod::Usage;
use File::Basename;
use  WOA::Config::Provider;

#my $app_root    = dirname(__FILE__).'/../';

my ($help);

GetOptions(
    'help|?'    => \$help,
);

pod2usage(1) if $help;

my $app_root    = $Bin.'/..';

my $app_config = WOA::Config::Provider->get_config($app_root.'/etc/Alproute.conf');

my $controller = $ARGV[0];
my $config = get_config();

my $data = $config->{path}->{$controller};
if ( $data ){
    process($data,$config);
}

exit(0);

sub process {
    my ($data,$config) = @_;
    my @command = ($config->{compiler});
	my $min_js_root = $app_root.$config->{js_root}.'/js/min';
	my $dev_js_root = $app_root.$config->{js_root};
    foreach ( @{$data->{js}} ){
        push @command,'--js '.$dev_js_root.$_;
    }
    push @command,' --module '.$data->{mname}.':'.int(@{$data->{js}});
    my $command = join ' ',@command;
    print "\n$command\n";
    chdir $min_js_root;
    system $command;
}

sub get_config {
    return {
        compiler    => 'java -jar /home/harper/soft/bin/compiler.jar',
        js_root     => '/public',
        path        => {
			'editor' => {
                js      =>  [
					"/js/dev/jquery.dynatree.js",
					"/js/dev/jquery.flexbox.js",
					"/js/dev/jquery.tmpl.js",
					
					"/js/dev/class.js",
					"/js/dev/jqgrid/i18n/grid.locale-ru.js",
					"/js/dev/jqgrid/base.js",
					"/js/dev/jqgrid/wrapper.js",
					
					"/js/dev/knockout.js",
					"/js/dev/controller.js",
					"/js/dev/autocomplete.js"
                ],
                mname   =>  'editor'
            },
		},
    };
}

1;

__END__


=head1 NAME

genjs.pl  - компиляция js модуля

=head1 SYNOPSIS

genjs.pl modulename
 
 Options:
   -? -help      вывод справки и выход

=head1 DESCRIPTION

Параметры: имя ключа из get_config->{path}
   в необходимой папке(public/js/min) будет создан скомпилированный js модуль
   js файлы берутся из public/js/dev - компилируются в папку public/js/min

В итоговой версии используется сжатая версия js модуля

Зависимости
   java
   google js compiler


=head1 AUTHOR


=head1 COPYRIGHT

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
