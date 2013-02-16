use utf8;
package Ahs::Model::DBIx::Result::PassportData;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ahs::Model::DBIx::Result::PassportData

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<passport_data>

=cut

__PACKAGE__->table("passport_data");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 serial

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 number

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 received

  data_type: 'integer'
  is_nullable: 0

=head2 place

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 date_of_birth

  data_type: 'integer'
  is_nullable: 0

=head2 place_of_birth

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 updated

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "serial",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "number",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "received",
  { data_type => "integer", is_nullable => 0 },
  "place",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "date_of_birth",
  { data_type => "integer", is_nullable => 0 },
  "place_of_birth",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "updated",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user

Type: belongs_to

Related object: L<Ahs::Model::DBIx::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Ahs::Model::DBIx::Result::User",
  { id => "user_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-02-10 00:53:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vvpbioqeKpOrOnRNk9RFIQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
