package Ahs::REST::Authenticator::Proxy;
use common::sense;
use base 'Ahs::REST::Authenticator::Backend';
use Ahs::REST::Authenticator::Map;
use WOA::Validator;
use Data::Dumper;

sub new {
    my($class,$opt) = @_;
    
    my $self;
    if ( $opt->{mode} eq 'local' ) {
        foreach (qw/model formatter fast_storage config/) {
            unless ( $opt->{$_} ) {
                die "[REQUIRED PARAM MISSED] paramName: '$_'.Must defined while object creation";
            }
        }
    }
    $self = $class->SUPER::new($opt); 
    bless $self,$class;
    
    return $self;
}

sub AUTOLOAD {
    (my $self,$opt)  = @_;
    (my $method = our $AUTOLOAD) =~ s/.*:://;
    if ( $self->can($method) && $self->get_mode() eq 'local' ) {
        # get validation rules for local method
        my $map = Maillist::REST::Authenticator::Map->get_map;
        my $rules;
        foreach ( @{$map} ) {
            if ( $_->{func} eq $method ) {
                $rules = $_->{in}->{param};
                last;
            }
        }
        foreach ( @$rules ) {
            if ( $opt->{$_->{name}} ) {
                $_->{value} = $opt->{$_->{name}}
            }
        }
        my $validator = WOA::Validator->new();
        $validator->clear();
        $validator->fields($rules);
        my $res = $validator->isValid();
        return $res;
    }
    return;
}

1;

__END__

=head1 Ahs::REST::Authenticator::Proxy


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
