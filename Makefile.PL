use inc::Module::Install;

# Define metadata
name 'WOA';
abstract 'Alpine human register REST services';
version '0.001';
author 'plcgi1@gmail.com';
license 'perl';
perl_version('5.10.1');

# Specific dependencies
requires 'Module::Install';
requires 'Try';
requires 'Plack';
requires 'Plack::Middleware::Session';
requires 'Plack::Middleware::Log4perl';
requires 'Plack::Middleware::Static';
requires 'Plack::Middleware::AccessLog';
requires 'Plack::Middleware::ContentMD5';

requires 'JavaScript::Value::Escape';
requires 'Carp';
requires 'Error'          => 0.17010;
requires 'File::Basename' => 2.77;
requires 'MIME::Base64'   => 3.08;
requires 'Mail::Mailer'   => 2.06;
requires 'Text::Xslate';
requires 'Text::Xslate::Bridge::TT2';
requires 'Config::General';
requires 'Config::Any';

requires 'File::Find'; 
requires 'Class::Accessor::Fast' => 0.31;
requires 'Class::Singleton';
requires 'Class::Inspector' => 1.25;

requires 'Encode::Guess' => 2.03;
requires 'POSIX'         => 1.17;

requires 'Test::Strict';
requires 'Test::Pod';
requires 'Test::Builder';
requires 'Test::Builder::Module';
requires 'Digest::HMAC_SHA1';
requires 'Digest::SHA1';

requires 'Getopt::Long' => 2.38;
requires 'Pod::Usage'   => 1.36;

requires 'JSON::XS' => 2.3;
requires 'Data::Dumper';

requires 'Exception::Class';

requires 'URI::Escape'   => 3.30;
requires 'interface'     => 0.03;
requires 'Date::Manip'   => 6.22;
requires 'base'          => 2.14;
requires 'common::sense' => 3.4;
requires 'parent'        => 0.225;
requires 'Locale::Maketext';
requires 'HTTP::Request::AsCGI';

requires 'Cache::FastMmap';

requires 'Class::Declare';
requires 'Log::Log4perl';
requires 'Log::Dispatch::FileRotate';

requires 'Plack::Middleware::Auth::AccessToken';

install_script glob('bin/*.pl');

auto_install;

WriteAll;

1;
