package Ahs::REST::View;
use strict;
use Encode qw/encode from_to decode/;
use JSON::XS qw/encode_json/;
use parent 'WOA::REST::Generic::View';

__PACKAGE__->mk_accessors(qw/session config/);

#sub as_json {
#	my ( $self, $obj, $is_utf8 ) = @_;
#
#	my $res;
#	if ($obj) {
#		my $coder = JSON->new();
#		$res = encode_json($obj);
#	}
#    return $res;
#}

sub as_html {
	my ( $self, $obj ) = @_;
	my $out;
	
    $out = $self->renderer->render( $obj->{template}, $obj );
	$out = encode('utf8',$out);
    
	return $out;
}

1;

__END__


=head1 NAME

Ahs::REST::View - []

=head1 SYNOPSIS

[]

=head1 DESCRIPTION

[]

=head2 EXPORT

TODO

=head1 SEE ALSO

TODO


=head1 GIT repository

=begin html

<a href="https://github.com/plcgi1/woa-toolkit-core">https://github.com/plcgi1/woa-toolkit-core</a>

=end html



=head1 BUGS

Please report any bugs or suggestions at L<https://github.com/plcgi1/woa-toolkit-core>


=head1 AUTHOR

plcgi E<lt>plcgi1 at gmail dot com<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by plcgi1

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
