#!/usr/bin/perl
use strict;
use Getopt::Long;
use Pod::Usage;

# скрипт для сжатия css
use CSS::Minifier::XS ;

my ($help,$src,$dest);

GetOptions(
    'help|?'    => \$help,
    'src|s=s'   => \$src,
    'dest|d=s'  => \$dest
);

pod2usage(1) if $help;

$src ||= '/home/harper/www/woa-toolkit/apps/Testsbox/public/css/vk.css' ;
$dest ||= '/home/harper/www/woa-toolkit/apps/Testsbox/public/css/vk-min.css' ;

my $minicss = getFileContent($src);
$minicss = CSS::Minifier::XS::minify($minicss);
writeFile($dest,$minicss);

sub getFileContent {
    my $fname = shift;
    
    my $content;
    open F, $fname || die "Cant open file = $!";
    while ( <F> ) {
        $content .= $_;
    }
    close F;
    return $content;
}

sub writeFile {
    my $fname = shift;
    my $content = shift;
    
    open F,">$fname" || die "Cant open file = $!";
    print F $content;
    close F;
}

1;


__END__


=head1 NAME

minicss.pl  - сжатие css

=head1 SYNOPSIS

minicss.pl --src=/path/to/source/css --dest=/path/to/target/compressed/css
 
 Options:
   -? -help      вывод справки и выход
   -src|s        файл-источник для сжатия ( по умолчанию - /home/harper/www/woa-toolkit/apps/Testsbox/public/css/vk.css)
   -dest|d       файл-результат ( по умолчанию - /home/harper/www/woa-toolkit/apps/Testsbox/public/css/vk-min.css )

=head1 DESCRIPTION

Зависимости
   CSS::Minifier::XS


=head1 AUTHOR


=head1 COPYRIGHT

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
