package Ahs::REST::Confirm::Engine;
use strict;
use Data::Dumper;
use JSON::XS qw/decode_json/;
use parent 'Ahs::REST::Engine';

sub process {
    my ( $self, $query_args ) = @_;
    return $self->SUPER::process($query_args);
}

sub finalize {
    my($self,$method_data,$res)=@_;
    if( $res->{errors} ) {
        $self->set_error_from_confirm('500',$res);        
    }
    else {
        $self->SUPER::finalize($method_data,$res);
    }
    return;
}

sub set_error_from_confirm {
    my($self,$http_status,$message_data)=@_;
    
    my $out = $self->view->as_json($data);
        
    $self->output($out);
    $self->content_type("application/json");
    
    return;
}

1;


__END__

=head1 NAME

Ahs::REST::Engine - extended WOA::REST::Engine engine for Frontend

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

Copyright (C) 2012 by plcgi1

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.7 or,
at your option, any later version of Perl 5 you may have available.


=cut
