package Ahs::REST::UserData::Backend;
use common::sense;
use parent 'Ahs::Component::TemporaryService';
use Data::Dumper;

sub new {
    my($class,$param) = @_;
	$param->{key} = 'usersdata';
    my $self = $class->SUPER::new($param);
    bless $self,$class;

    return $self;
}
1;

__END__

=head1 Ahs::REST::Goals::Backend


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
