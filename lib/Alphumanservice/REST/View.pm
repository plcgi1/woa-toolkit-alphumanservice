package Alphumanservice::REST::View;
use strict;
use Encode qw/from_to decode is_utf8 encode/;
use Data::Dumper;
use parent 'WOA::REST::Generic::View';

sub as_json {
	my ( $self, $obj, $is_utf8 ) = @_;

	my $res;
	if ($obj) {
		my $coder = JSON::XS->new();
		$res = JSON::XS->new->utf8->allow_nonref->encode($obj);
	}

	return $res;
}

sub as_html {
	my ( $self, $obj ) = @_;
	$obj->{topnav} = [
	
	];
	$obj->{subnav} = [
		{ url => "/part-form/project", name => "project", title => "Проект" },
		{ url => "/part-form/place", name => "place", title => "Куда" },
		{ url => "/part-form/part", name => "part", title => "Участники" },
		{ url => "/part-form/goals", name => "goals", title => "Цели" },
	];
	my $p = lc((split '/',$obj->{template})[-1]);
	$p=~s/\.tpl$//;
	foreach ( @{$obj->{subnav}} ) {
		delete $_->{class};
		if( $_->{name} eq $p ){
			$_->{class} = 'active';
		}
		$_->{page} = $p;
	}
	#warn "".Dumper $obj;
	my $out = $self->renderer->render( $obj->{template}, $obj );
	$out = encode('utf8',$out);

	return $out;
}

1;

__END__


=head1 NAME

Alphumanservice::REST::View - []

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
