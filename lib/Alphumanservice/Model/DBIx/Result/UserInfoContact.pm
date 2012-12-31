use utf8;
package Alphumanservice::Model::DBIx::Result::UserInfoContact;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Alphumanservice::Model::DBIx::Result::UserInfoContact

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user_info_contacts>

=cut

__PACKAGE__->table("user_info_contacts");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'bigint'
  is_foreign_key: 1
  is_nullable: 0

=head2 phone1

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 phone2

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 phone3

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 skype

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 icq

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "user_id",
  { data_type => "bigint", is_foreign_key => 1, is_nullable => 0 },
  "phone1",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "phone2",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "phone3",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "skype",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "icq",
  { data_type => "varchar", is_nullable => 1, size => 255 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Uzg62lJzkJmF+aeLVQ62Yg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
