package Alphumanservice::Component::Projectdata;
use common::sense;
use Try;
use base 'Class::Accessor::Fast';
use Data::Dumper;

__PACKAGE__->mk_accessors(qw/model session/);

sub save_project {
    my ($self,$model,$session,$param) = @_;
    my $res;
    try {
        my $data = $session->{project_data};
        my $rs = $model->resultset('Project')->find_or_create({
            name        => $data->{name},
            owner_id    => $param->{user_id}
        });
        unless ( $rs->get_column('created') ) {
            $rs->created(time);
        }
        $rs->updated(time);
        $rs->update();
        $res = { name => $data->{name}, id => $rs->get_column('id') };
    }
    catch {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_project]".Dumper @_ });
    }
    return $res;
}

sub save_goals {
    my ($self,$model,$session,$param) = @_;
    my $res;
    my $data = $session->{goals};
    try {
        my @rs = $model->resultset('Project')->search({project_id => $param->{project_id} });
        foreach ( @rs ) {
            $_->delete();
        }
        my @goal_id;
        foreach (keys %$data) {
            my $rs = $model->resultset('Goal')->find_or_create({
                name        => $data->{$_}->{text},
                project_id  => $param->{project_id}
            });
            unless ( $rs->get_column('created') ) {
                $rs->created(time);
            }
            $rs->updated(time);
            $rs->update();
            push @goal_id,{ name => $rs->get_column('name'), id => $rs->get_column('id') };
        }
        $res = \@goal_id;
    }
    catch  {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_goals]".Dumper @_ });
    }
    return $res;
}

sub save_geo {
    my ($self,$model,$session,$param) = @_;
    my $res;
    my $data = $session->{geodata};
    try {
        my $rs = $model->resultset('Place')->find_or_create({
            user_id     => $param->{user_id},
            lattitude   => $data->{lattitude},
            longtitude  => $data->{longtitude}
        });
        $rs->name($data->{name});
        unless ( $rs->get_column('created') ) {
            $rs->created(time);
        }
        $rs->updated(time);
        
        $rs->update();
        $res = {
            id => $rs->get_column('id')
        };
    }
    catch  {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_geo]".Dumper @_ });
    }
    return $res;
}

sub save_passport {
    my ($self,$model,$session,$param) = @_;
    try {
        my $data = $session->{users_data};
    }
    catch  {
        
    }
    return;
}

sub save_ensurance {
    my ($self,$model,$session,$param) = @_;
    try {
        my $data = $session->{users_data};
    }
    catch  {
        
    }
    return;
}

1;

__END__

=head1 Alphumanservice::REST::UserData::Backend


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
