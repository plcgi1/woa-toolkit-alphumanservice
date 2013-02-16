package Ahs::Formatter;
use common::sense;
use Encode qw(from_to decode is_utf8);
use DateTime;
use Time::Local;
use Ahs;
use base 'WOA::Formatter';

sub to_mysql_datetime {
    my ($self, $param ) = @_;
    my $res = join '-',($param->{year},$param->{month},$param->{day});
    return $res;
}

sub to_uts {
    my ($self, $param ) = @_;

    my($d,$m,$y) = split '\-',$param->{date};
    my($h,$min,$s)=split(':',$param->{time});
    my $res;
    if( $y && $m && $d ){
        #my $dt = DateTime->new(
        #    year    => $y,
        #    month   => $m,
        #    day     => $d,
        #    hour    => $h,
        #    minute  =>  $min
        #);
        #$res = $dt->epoch;
        $res = timelocal(0, $min, $h, $d, $m-1, $y);
    }
    
    return $res;
}


1;

__END__