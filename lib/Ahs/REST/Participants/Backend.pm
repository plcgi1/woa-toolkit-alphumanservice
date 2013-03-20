package Ahs::REST::Participants::Backend;
use common::sense;
use base 'Ahs::REST::Backend';
use Data::Dumper;
use Digest::MD5 qw/md5_hex/;

sub get {
    my ( $self, $param ) = @_;

    my $config  = $self->get_config;
    my $session = $self->get_session();
    my $model = $self->get_model();
    my $fmt = $self->get_formatter;

    my @rs = $model->resultset('UserInfo')->search(
    	{
		},
    	{
			join => [qw/user/],
			select => [qw/me.user_id user.fname user.lname user.mname me.filename/],
			as => [qw/user_id fname lname mname filename/],
    		order_by => $param->{sord} || 'user.lname'
    	}
   	);
   	my @res;
    foreach ( @rs ) {
    	my $hash = {
    		id 			=> $_->get_column('user_id'),
			#date_of_birth => $fmt->format_ts($_->get_column('date_of_birth')),
    		fio 	=> $fmt->encode_utf(join ("  ",$_->get_column('lname'),$_->get_column('fname'),$_->get_column('mname')))
    	};
		my $file = $_->get_column('filename');
		if ( $file ) {
			my $ext = (split '\.',$file)[-1];
			$hash->{filename} = md5_hex($file).'.'.$ext;
		}
		else {
			$hash->{filename} = '../no-photo.gif';
		}
		
		push @res,$hash;
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
