package Alproute::Model::DBIx::Result::Description;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Alproute::Model::DBIx::Result::Description

=cut

__PACKAGE__->table("description");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 content

  data_type: 'text'
  is_nullable: 0

=head2 images

  data_type: 'text'
  is_nullable: 1

=head2 location_id

  data_type: 'bigint'
  is_nullable: 0

=head2 difficulty

  data_type: 'varchar'
  is_nullable: 0
  size: 125

=head2 category

  data_type: 'varchar'
  is_nullable: 0
  size: 125

=head2 high

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "content",
  { data_type => "text", is_nullable => 0 },
  "images",
  { data_type => "text", is_nullable => 1 },
  "location_id",
  { data_type => "bigint", is_nullable => 0 },
  "difficulty",
  { data_type => "varchar", is_nullable => 0, size => 125 },
  "category",
  { data_type => "varchar", is_nullable => 0, size => 125 },
  "high",
  { data_type => "integer", is_nullable => 0 },
  "first_boss",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2011-10-29 01:07:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iWjdMIK2ZiTHV91Q6BWOLg


# You can replace this text with custom content, and it will be preserved on regeneration

__PACKAGE__->belongs_to(
    "location",
    "Alproute::Model::DBIx::Result::Location",
    { id => "location_id" },
    { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);
1;
