package Ahs::REST::Participants::Backend;
use common::sense;
use base 'Ahs::REST::Backend';
use Data::Dumper;


sub get {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model = $self->get_model();
    my $fmt = $self->get_formatter;

    my @rs = $model->resultset('User')->search(
    	{},
    	{
    		order_by => $param->{sord} || 'lname'
    	}
   	);
   	my @res;
    foreach ( @rs ) {
    	push @res,{
    		id => $_->get_column('id'),
    		fio => $fmt->encode_utf(join ("  ",$_->get_column('lname'),$_->get_column('fname'),$_->get_column('mname')))
    	}
    }

    return \@res;
}



1;

__END__

=head1 Ahs::REST::Participants::Backend


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
