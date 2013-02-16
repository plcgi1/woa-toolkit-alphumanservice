package Ahs::Page;
use common::sense;
use base 'WOA::REST::ServiceProvider';
use Ahs::REST::View;
use Ahs::REST::Engine;
use Data::Dumper;

__PACKAGE__->mk_accessors(qw/stash view model session config formatter env request log/); 

sub get_map { die "Must be implemented" }

sub default_pages {
    my ($self,$nav) = @_;
    
    my @arr;
    if ( $nav && int(@$nav) > 0 ) {
       @arr = @{$nav};
    }
    else {
        my @rs = $self->get_model->resultset('Action')->search(
            {
                'me.is_public'  => 1,
                'me.type'       => 'page',
                '-or' => [
                    'me.parentid'   => undef,
                    'me.parentid'   => '0'
                ]                
            },
            { order_by          => 'me.description' }
        );
        foreach ( @rs ) {
            push @arr,{
                title   =>  $_->get_column('description'),
                name    =>  $_->get_column('name'),
                path    =>  $_->get_column('path'),
                parentid    =>  $_->get_column('parentid'),
                is_public => 1,
            };
        }
    }
    return \@arr;
}

sub service_object {
    my ( $self, $env ) = @_;

    $self->set_session($env->{'session'});
    $self->set_config($env->{config});
    $self->set_model($env->{model});
    $self->set_request($env->{request});
    $self->set_env($env->{env});
    $self->set_formatter($env->{formatter});
    $self->set_log($env->{log});
    
    my $session = $self->get_session;
    my $nav = $self->default_pages($session->{nav});
    if ( $session->{acl} ) {
        my @arr;
        foreach my $a( @{$session->{acl}} ) {
            my $fount;
            foreach my $b( @{$nav} ) {
                if( $b->{name} eq $a->{name} ) {
                    $fount = 1;
                    last;
                }
            }
            if( $a->{type} eq 'page' && !$a->{parentid} ) {
                if ( !$fount  ) {
                    push @arr,$a;
                }
            }
        }
        $session->{nav} = [@$nav,@arr];
    }
    else {
        $session->{nav} = $nav;
    }
    
    my %stash;
    
    $stash{nav} = $session->{nav};
    my $path = ( split '\?', $env->{request}->request_uri )[0];
    foreach ( @{$stash{nav}} ) {
        $_->{class} = '';
        if($_->{children}) {
            foreach my $child ( @{$_->{children}} ) {
                $child->{class} = '';
                if( $child->{path} eq $path ) {
                    $_->{class}     = 'active';
                    $child->{class} = 'active';
                    $stash{subnav}  = $_->{children};
                }
            }
        }
        else {
            if( $_->{path} eq $path ) {
                $_->{class}     = 'active';
            }
        }
    }
    
    if ( $session->{user} ){
        $stash{login} = $session->{user}->{login};
    }
    
    $self->set_stash(\%stash);
    
    my $view    = Ahs::REST::View->new({ config => $env->{config}, renderer => $env->{renderer}, session => $env->{session} });
    my $rest    = Ahs::REST::Engine->new({
        map     =>  $self->get_map,
        backend =>  $self,
        view    =>  $view,
    });
        
    return $rest;
}

1;