package Ahs::REST::Settings::Contacts::Backend;
use common::sense;
use base 'Ahs::REST::Backend';
use Data::Dumper;


sub save {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model = $self->get_model;
    
    my $rs = $model->resultset('UserInfo')->single(
        {'user_id' => $session->{user}->{id} },
    );
    my $u = $model->resultset('User')->single(
        {'id' => $session->{user}->{id} },
    );
    if ( $rs ) {
        $rs->phone1($param->{phone1});
        $rs->phone1($param->{phone2});
        $rs->phone1($param->{phone3});
        $rs->phone1($param->{icq});
        $rs->phone1($param->{skype});
        $rs->phone1($param->{twitter});
        $rs->phone1($param->{address});
        $rs->update();
        
        $u->email($param->{email});
        $u->fname($param->{fname});
        $u->lname($param->{lname});
        $u->mname($param->{mname});
        $u->updated(time);
        $u->update();
    }
    # make return with values - for tests
    my $res = $param;

    return $res;
}


sub get {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model = $self->get_model;
    
    my @rs = $model->resultset('UserInfo')->search(
        {user_id=>$session->{user}->{id}},
        {
            join => [qw/user/],
            select => [qw/me.skype me.phone1 me.phone2 me.phone3 me.skype me.twitter me.address user.fname user.lname user.mname user.email/],
            as => [qw/skype phone1 phone2 phone3 skype twitter address fname lname mname email/],
            limit => 1
        }
    );
    
    # make return with values - for tests
    my $res;
    foreach ( qw/skype phone1 phone2 phone3 skype twitter address fname lname mname email/ ) {
        $res->{$_} = $rs[0]->get_column($_);
    }

    return $res;
}

sub remove {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    
    # make return with values - for tests
    my $res = { status => 'ok' };

    return $res;
}

1;

__END__

=head1 Ahs::REST::Settings::Contacts::Backend


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
