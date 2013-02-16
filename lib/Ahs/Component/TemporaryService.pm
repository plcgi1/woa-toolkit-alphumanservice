package Ahs::Component::TemporaryService;
use common::sense;
use base 'Ahs::REST::Backend';
use Digest::MD5 qw/md5_hex/;
use Data::Dumper;

__PACKAGE__->mk_accessors(qw/key resultset_name/);

sub confirm {
    my ( $self, $param ) = @_;
    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model   = $self->get_model;
    my $key = $self->get_key;
}

sub save {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model   = $self->get_model;
    my $key 	= $self->get_key;
    my $rs;
	my $data = $session->{$key};
    
	unless ( $data ) {
    	$data = {};
    }
    unless ( $param->{id} ){
        # generate id
        $param->{id} = $self->id;
    }
    
    $data->{$param->{id}} = $param;
    $session->{$key} = $data;
    my $res = $self->_hash_to_array($session->{$key});
    
    return $res;
}

sub get {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $key = $self->get_key;
    my $res = $self->_hash_to_array($session->{$key});
    
    return $res;
}

sub remove {
	my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $key = $self->get_key;
    delete $session->{$key}->{$param->{id}};
    
    my $res = $self->_hash_to_array($session->{$key});
        
    return $res;
}

sub id {
    my ( $self ) = @_;
    my @al = (0..9,'a'..'z','A'..'Z');
    my $id;
    foreach ( 0..8 ) {
        my $i = int(rand(@al));
        $id .= $al[$i];
    }
    return md5_hex($id);
}

sub _hash_to_array {
    my ( $self, $data ) = @_;
    my @res;
	if(ref $data eq 'HASH') {
		foreach ( keys %{$data} ) {
			push @res,$data->{$_};
		}
	}
	else {
		@res = @$data;
	}
    return \@res;
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
