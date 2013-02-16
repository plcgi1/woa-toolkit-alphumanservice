package Ahs::Component::ProjectData;
use common::sense;
use Try;
use base 'Class::Accessor::Fast';
use Data::Dumper;

#__PACKAGE__->mk_accessors(qw/model session/);

sub process {
    my ($self,$model,$session,$param) = @_;
    
    my (@res,$res);
    my @errors;
    try {
        $res = $self->save_project($model,$session,$param);
    }
    catch {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_project]".Dumper @_ });
        push @errors,'project';
    }
    push @res,$res;
    
    try {
        $param->{project_id} = $res->{data}->{id};
        $res = $self->save_geo($model,$session,$param);
    }
    catch {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_geo]".Dumper @_ });
        push @errors,'geodata';
    }
    push @res,$res;
    
    try {
        $res = $self->save_goals($model,$session,$param);
    }
    catch {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_goals]".Dumper @_ });
        push @errors,'goals';
    }
    push @res,$res;
    
    try {
        $res = $self->save_users($model,$session,$param);
    }
    catch {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_users]".Dumper @_ });
        push @errors,'users';
    }
    push @res,$res;
    
    try {
        $res = $self->save_passport($model,$session,$param);
    }
    catch {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_passport]".Dumper @_ });
        push @errors,'passport';
    }
    push @res,$res;
    
    try {
        $res = $self->save_ensurance($model,$session,$param);
    }
    catch {
        $self->get_env->{'psgix.logger'}->({level => 'error', message => "[save_ensurance]".Dumper @_ });
        push @errors,'ensurance';
    }
    push @res,$res;
        
    undef $res;
    if( int(@errors) ) {
        $res->{errors} = \@errors;
    }
    else {
        $res->{success} = \@res;
    }
    return $res;
}

sub save_project {
    my ($self,$model,$session,$param) = @_;
    my $res;
    
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
    $res = { name => 'project',  data => { name => $data->{name}, id => $rs->get_column('id') } };

    return $res;
}

sub save_goals {
    my ($self,$model,$session,$param) = @_;
    my $res;
    my $data = $session->{goals};
    my @rs = $model->resultset('Goal')->search({project_id => $param->{project_id} });
    foreach ( @rs ) {
        $_->delete();
    }
    my @goal_id;
    foreach (keys %$data) {
        my $rs = $model->resultset('Goal')->create({
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
    $res = { data => \@goal_id, name => 'goals' };
    return $res;
}

sub save_geo {
    my ($self,$model,$session,$param) = @_;
    my $res;
    my $data = $session->{geodata}->[0];
    my $rs = $model->resultset('Place')->find_or_create({
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
        name => 'geodata', data => { id => $rs->get_column('id') }
    };
    return $res;
}

sub save_users {
    my ($self,$model,$session,$param) = @_;
    my $data = $session->{users_data};
    unless ( ref $data eq 'ARRAY' ) {
        $data = [$data];
    }
    foreach ( @$data ) {
        my $key = (keys $_)[0];
        my $hash = $_->{$key};
        my $rs = $model->resultset('User')->find_or_create({
            fname => $hash->{fname},
            mname => $hash->{mname},
            lname => $hash->{lname}
        });
        $hash->{user_id} = $rs->get_column('id');
        $model->resultset('UserProject')->find_or_create({
            user_id     => $hash->{user_id},
            project_id  => $param->{project_id}
        });
    }
    return { name => 'users', data => $data };
}

sub save_passport {
    my ($self,$model,$session,$param) = @_;
    my $data = $session->{users_data};
    my $now = time;
    unless ( ref $data eq 'ARRAY' ) {
        $data = [$data];
    }
    foreach ( @$data ) {
        my $key = (keys $_)[0];
        my $hash = $_->{$key};
        my $passport = $model->resultset('PassportData')->find_or_create({
            user_id => $hash->{user_id},
        });
        $passport->serial($hash->{serial});
        $passport->number($hash->{number});
        $passport->received($hash->{received});
        $passport->place($hash->{place});
        $passport->date_of_birth($hash->{date_of_birth});
        $passport->place_of_birth($hash->{place_of_birth});
        $passport->updated($now);
        
        $passport->update();
    }
    return {name => 'passport', data => $data };
}

sub save_ensurance {
    my ($self,$model,$session,$param) = @_;
    my $data = $session->{users_data};
    my $now = time;
    unless ( ref $data eq 'ARRAY' ) {
        $data = [$data];
    }
    foreach ( @$data ) {
        my $key = (keys $_)[0];
        my $hash = $_->{$key};
        my $ensurance = $model->resultset('EnsuranceData')->find_or_create({
            ensurance_number => $hash->{ensurance_number}
        });
        foreach my $col ( @{$ensurance->columns} ) {
            if ( $ensurance->can($col) && $hash->{$col} ) {
                $ensurance->$col($hash->{$col});
            }
        }
        unless ( $ensurance->created ) {
            $ensurance->created($now);
        }
        $ensurance->updated($now);
        $ensurance->update();
        
        $model->resultset('EnsuranceUser')->find_or_create({
            user_id         => $hash->{user_id},
            ensurance_id    => $ensurance->get_column('id')
        });
    }
    return {name => 'ensurance', data => $data };
}

1;

__END__

=head1 Ahs::REST::UserData::Backend


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
