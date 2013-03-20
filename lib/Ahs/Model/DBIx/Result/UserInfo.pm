use utf8;
package Ahs::Model::DBIx::Result::UserInfo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ahs::Model::DBIx::Result::UserInfo

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user_info>

=cut

__PACKAGE__->table("user_info");

=head1 ACCESSORS

=head2 user_id

  data_type: 'bigint'
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

=head2 twitter

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 address

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "user_id",
  { data_type => "bigint", is_nullable => 0 },
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
  "twitter",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "address",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "filename",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "content_type",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "size",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-02-10 00:53:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pNUHr4nwFTR6+pgZ0U4BcQ

__PACKAGE__->set_primary_key("user_id");

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->belongs_to(
  "user",
  "Ahs::Model::DBIx::Result::User",
  { id => "user_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
1;
