package Ahs::REST::Settings::Passport::Backend;
use common::sense;
use base 'Ahs::REST::Backend';
use Data::Dumper;


sub save {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model = $self->get_model;
    my $fmt = $self->get_formatter;
    
    my $rs = $model->resultset('PassportData')->single(
        {'user_id' => $session->{user}->{id} },
    );
    my $u = $model->resultset('User')->single(
        {'id' => $session->{user}->{id} },
    );
        
    if ( $rs ) {
        $rs->serial($param->{serial});
        $rs->number($param->{number});
        $rs->received($fmt->to_uts({date=>$param->{received}}));
        $rs->place($param->{place});
        $rs->date_of_birth(
            $fmt->to_uts( {date => $param->{date_of_birth} })
        );
        $rs->place_of_birth($param->{place_of_birth});
        
        $rs->update();
        
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
    my $fmt = $self->get_formatter;
    
    my @rs = $model->resultset('PassportData')->search(
        { user_id => $session->{user}->{id} },
        {
            join => [qw/user/],
            select => [qw/me.serial me.number me.received me.place me.date_of_birth me.place_of_birth user.fname user.lname user.mname user.email/],
            as => [qw/serial number received place date_of_birth place_of_birth fname lname mname email/],
            limit => 1
        }
    );
    
    # make return with values - for tests
    my $res;
    foreach ( qw/serial number received place date_of_birth place_of_birth fname lname mname email/ ) {
        $res->{$_} = $rs[0]->get_column($_);
    }
    $res->{received} = (split ' ',$fmt->format_ts($res->{received}))[0];
    $res->{date_of_birth} = (split ' ',$fmt->format_ts($res->{date_of_birth}))[0];
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

=head1 Ahs::REST::Settings::Passport::Backend


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
