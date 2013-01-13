package Alphumanservice::REST::Auth::Backend;
use common::sense;
use base 'Alphumanservice::REST::Backend';
use Data::Dumper;
use Digest::MD5 qw/md5_hex/;
use Time::HiRes;
use JSON::XS qw/encode_json decode_json/;

__PACKAGE__->mk_accessors(qw/mode/);

# length for message sign
my $DEFAULT_LENGTH = 64;

# length for idKey
my $DEFAULT_UNIQID_LENGTH = 12;

my $DEFAULT_TTL = 86400;

sub default {
    return {
        length          => $DEFAULT_LENGTH,
        uniqid_length   => $DEFAULT_UNIQID_LENGTH,
        ttl             => $DEFAULT_TTL
    };
}

sub login {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $res;
    
    # find token for app with app data
    my $app = $self->get_model()->resultset('Site')->single({token => $param->{token}});
    if ( $app ) {
        my @user = $self->get_model()->resultset('UserSite')->search(
            {
                'users.login'       => $param->{login},
                'users.password'    => md5_hex($param->{password}),
                'site.id'           => $app->get_column('id')
            },
            {
                join    => [qw/users site/],
                select  => [qw/users.login users.actions users.id/],
                as      => [qw/login actions id/],
                limit   => 1
            }
        );
        if ( $user[0] ) {
            # get ACL user data
            $res->{acl} = $self->_get_acl_data($user[0],$app);
            $session->{acl}     = $res->{acl};
            $session->{user}    = {
                login => $user[0]->get_column('login'),
                id    => $user[0]->get_column('id')
            };
            
            #$self->_set_navigation_data_to_session($res->{acl},$session);
            
            # create token with TTL
            # set ACL user data to response
            $res->{token} = $self->_uniqid();
            
            # save ACL user data to fast_storage with token
            $param->{ttl} ||= $self->default->{ttl};
            $self->get_fast_storage()->set($res->{token},$res->{acl},$param->{ttl});
        } # END if ( $user[0] )
    } # END if ( $rs[0] )
    
    return $res;
}

sub logout {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    
    # make return with values - for tests
    #my $d = $self->get_fast_storage()->set($param->{token});
    $self->set_session({});
    
    return { deleted => 1 };

}

sub acl {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    
    # make return with values - for tests
    my $res = { status => 'ok' };

    return $res;

}

sub has_access {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    
    # make return with values - for tests
    my $res = { status => 'ok' };

    return $res;
}

sub _get_acl_data {
    my ($self,$user,$app) = @_;
    my $action_id_array = decode_json($user->get_column('actions'));
    
    my @actions = $self->get_model()->resultset('Action')->search({
        id      => { -in => $action_id_array }
    });
    my @arr;
    if ( $actions[0] ) {
        foreach ( @actions ) {
            push @arr, {
                method_type => decode_json($_->get_column('method_type')),
                title       => $_->get_column('description'),
                name        => $_->get_column('name'),
                path        => $_->get_column('path'),
                parentid    => $_->get_column('parentid'),
                type        => $_->get_column('type'),
            }
        }
    }
    return \@arr;
}

sub _set_navigation_data_to_session {
    my ($self,$acl,$session) = @_;
    my @a;
    foreach ( keys %{$acl} ) {
        push @a, {
            path  => $_,
            title => $acl->{$_}->{title},
            name  => $acl->{$_}->{name}
        };
    }
    $session->{nav} = \@a;
}

sub _uniqid {
    my ($self,$length) = @_;

    my $unique = $ENV{UNIQUE_ID} || ( [] . rand() );
    $length ||= $self->default->{length};
    my $res = substr(
        Digest::MD5::md5_hex( Time::HiRes::gettimeofday() . $unique ),
        0,
        $length
    );
            
    return $res;
}

1;

__END__

=head1 Alphumanservice::REST::Authenticator::Backend


=head2 SYNOPSIS

[TODO]

=head2 DESCRIPTION

[TODO]

=head2 EXAMPLES

[TODO]

=head2 EXPORT

[TODO]

=head2 SEE ALSO

[TODO]

=head2 AUTHOR

plcgi E<lt>plcgi1 at gmail dot com<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by plcgi1

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
