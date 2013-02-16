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

my $app_config = WOA::Config::Provider->get_config($app_root.'/etc/Reports.conf');

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
			'auth' => {
				js => [
					"/js/libs/underscore.js",
					"/js/libs/jquery.preloader.js",
					"/js/libs/bootstrap/bootstrap-dropdown.js",
					"/js/libs/mustache.js",
					"/js/libs/backbone.js",
					"/js/app/app.js",
					"/js/app/auth/main.js"
				],
				mname => 'auth'
			},
			'tasks' => {
                js      =>  [
					"/js/libs/bootstrap/bootstrap-dropdown.js",
					"/js/libs/bootstrap/bootstrap-tooltip.js",
					"/js/libs/jquery.jgrowl.js",
					"/js/libs/jquery.cookie.js",
					"/js/libs/jquery.timepicker.js",
					"/js/libs/datetime.js",
							
					"/js/libs/jquery.ui.core.js",
					"/js/libs/jquery.ui.widget.js",
					"/js/libs/jquery.ui.position.js",
					"/js/libs/jquery.ui.dialog.js",
					"/js/libs/jquery.ui.mouse.js",
					"/js/libs/jquery.ui.sortable.js",
					"/js/libs/jquery.ui.draggable.js",
					"/js/libs/jquery.ui.droppable.js",
					"/js/libs/jquery.ui.progressbar.js",
					"/js/libs/jquery.ui.datepicker.js",
					"/js/libs/mustache.js",
					"/js/libs/jquery.formParser.js",
			
					"/js/libs/mColorPicker.js",
					"/js/libs/underscore.js",
					"/js/libs/backbone.js",
					"/js/libs/jqgrid/i18n/grid.locale-ru.js",
					"/js/libs/jqgrid/base.js",
					"/js/libs/jqgrid/backbone.js",
					
					"/js/libs/bootstrap/bootstrap-timeline.js",
					
					"/js/app/app.js" ,
					"/js/libs/errorvis.js",
					"/js/app/auth/main.js",
					"/js/app/tasks/main.js",
					"/js/app/tasks/toggle-pane.js",
					"/js/app/tasks/warning.js",
					"/js/app/tasks/worktime.js",                        
					"/js/app/tasks/timers.js",        
					"/js/app/tasks/users.js",
					"/js/app/tasks/tasks.js",
					"/js/app/tasks/kanban.js",    
					"/js/app/tasks/filter.js"
					,"/js/app/tasks/timeline.js"
                ],
                mname   =>  'tasks'
            },
			'task' => {
				js => [
					"/js/libs/bootstrap/bootstrap-dropdown.js",
					"/js/libs/jquery.jgrowl.js",
					
					"/js/libs/datetime.js",
					"/js/libs/jquery.timepicker.js",
					"/js/libs/jquery.ui.core.js",
					"/js/libs/jquery.ui.widget.js",
					"/js/libs/jquery.ui.position.js",
					"/js/libs/jquery.ui.dialog.js",
					"/js/libs/jquery.ui.mouse.js",
					"/js/libs/jquery.ui.sortable.js",
					"/js/libs/jquery.ui.draggable.js",
					"/js/libs/jquery.ui.droppable.js",
					"/js/libs/jquery.ui.progressbar.js",
					"/js/libs/jquery.ui.datepicker.js",
					"/js/libs/mustache.js",
					"/js/libs/validator.js",
					"/js/libs/jquery.formParser.js",
					"/js/libs/jquery.preloader.js",
					"/js/libs/underscore.js",
					"/js/libs/backbone.js",
					
					"/js/app/app.js" ,
					"/js/libs/errorvis.js",
					"/js/validator/Task.js",
					"/js/app/auth/main.js",
					"/js/app/task/main.js",
					"/js/app/task/task.js"
				],
				mname => 'task'
			},
			calendar => {
				js => [
					"/js/libs/bootstrap/bootstrap-dropdown.js",
					"/js/libs/jquery.jgrowl.js",
					"/js/libs/datetime.js",
					"/js/libs/jquery.timepicker.js",
					"/js/libs/jquery.ui.core.js",
					"/js/libs/jquery.ui.widget.js",
					"/js/libs/jquery.ui.position.js",
					"/js/libs/jquery.ui.dialog.js",
					"/js/libs/jquery.ui.mouse.js",
					"/js/libs/jquery.ui.sortable.js",
					"/js/libs/jquery.ui.draggable.js",
					"/js/libs/jquery.ui.droppable.js",
					"/js/libs/jquery.ui.progressbar.js",
					"/js/libs/fullcalendar.js",
					"/js/libs/mustache.js",
					"/js/libs/validator.js",
					"/js/libs/jquery.formParser.js",
					"/js/libs/jquery.preloader.js",
					"/js/libs/underscore.js",
					"/js/libs/backbone.js",
					
					"/js/app/app.js" ,
					"/js/app/auth/main.js",
					"/js/app/calendar/main.js"
				],
				mname => 'calendar'
			}
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

В итоговой версии используется сжатая версия js модуля

Зависимости
   java
   google js compiler


=head1 AUTHOR


=head1 COPYRIGHT

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
