use utf8;
package Alphumanservice::Model::DBIx::Result::UserInfoPassport;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Alphumanservice::Model::DBIx::Result::UserInfoPassport

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user_info_passport>

=cut

__PACKAGE__->table("user_info_passport");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'bigint'
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

  data_type: 'bigint'
  is_nullable: 0

=head2 place

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 date_of_birth

  data_type: 'bigint'
  is_nullable: 0

=head2 place_of_birth

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 fname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 mname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 lname

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 updated

  data_type: 'bigint'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "user_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "serial",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "number",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "received",
  { data_type => "bigint", is_nullable => 0 },
  "place",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "date_of_birth",
  { data_type => "bigint", is_nullable => 0 },
  "place_of_birth",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "fname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "mname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "lname",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "updated",
  { data_type => "bigint", is_nullable => 0 },
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

Related object: L<Alphumanservice::Model::DBIx::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Alphumanservice::Model::DBIx::Result::User",
  { id => "user_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2012-12-25 16:47:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wQe5uO0k3Rd/iloHOEq+jA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
