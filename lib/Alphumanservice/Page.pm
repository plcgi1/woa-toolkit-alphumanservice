package Alphumanservice::Page;
use common::sense;

use Alphumanservice::REST::View;
use Alphumanservice::REST::Engine;
use base 'WOA::REST::ServiceProvider';
use Data::Dumper;

__PACKAGE__->mk_accessors(qw/view model session config formatter env request log/); 

sub default_pages {
    return [
        { title => 'О сервисе', name => 'about', path => '/about' },
        { title => 'Участники', name => 'part', path => '/parts' }
    ];
}

sub get_map { die "Must be implemented" }

sub service_object {
    my ( $self, $env ) = @_;

    $self->set_session($env->{'session'});
    my $session = $self->get_session;
    
    $self->set_config($env->{config});
    $self->set_model($env->{model});
    $self->set_request($env->{request});
    $self->set_env($env->{env});
    $self->set_formatter($env->{formatter});
    $self->set_log($env->{log});
    
    my $nav;
    $nav = $self->default_pages();
    if ( $env->{'session'}->{acl} ) {
        push @$nav,@{$session->{acl}};
    }
        
    $self->set_stash({
        nav => $nav,
        login => $session->{login}
    });
    
    my $view    = Alphumanservice::REST::View->new({ renderer => $env->{renderer} });
    my $rest    = Alphumanservice::REST::Engine->new({
        map     =>  $self->get_map,
        backend =>  $self,
        view    =>  $view,
    });
    warn "".Dumper $self->{name};    
    return $rest;
}

sub _set_active_pages {
    my($self,$parent,$child,$session) = @_;
    if ( $child->{type} eq 'page' ) {
        $session->{active_page} = $parent->{name};
        $session->{active_subpage} = $child->{name};
    }
    return;
}

1;