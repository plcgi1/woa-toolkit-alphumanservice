use utf8;
package Alphumanservice::Model::DBIx::Result::EnsuranceData;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Alphumanservice::Model::DBIx::Result::EnsuranceData

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<ensurance_data>

=cut

__PACKAGE__->table("ensurance_data");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 ensurance_number

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 ensurance_date

  data_type: 'integer'
  is_nullable: 0

=head2 ensurance_name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 ensurance_date_till

  data_type: 'integer'
  is_nullable: 0

=head2 ensurance_comment

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 currency

  data_type: 'varchar'
  is_nullable: 0
  size: 4

=head2 summ

  data_type: 'float'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "ensurance_number",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "ensurance_date",
  { data_type => "integer", is_nullable => 0 },
  "ensurance_name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "ensurance_date_till",
  { data_type => "integer", is_nullable => 0 },
  "ensurance_comment",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "currency",
  { data_type => "varchar", is_nullable => 0, size => 4 },
  "summ",
  { data_type => "float", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-02-01 00:29:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aykfYfMFHqAv7fguNRKFzA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
