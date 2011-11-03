package Alproute::Model::DBIx::Result::Location;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Alproute::Model::DBIx::Result::Location

=cut

__PACKAGE__->table("location");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 parent_id

  data_type: 'bigint'
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 path

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 created

  data_type: 'bigint'
  is_nullable: 0

=head2 updated

  data_type: 'bigint'
  is_nullable: 0

=head2 creator_id

  data_type: 'bigint'
  is_nullable: 0

=head2 leaf

  data_type: 'tinyint'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "parent_id",
  { data_type => "bigint", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "path",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "context",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "created",
  { data_type => "bigint", is_nullable => 0 },
  "updated",
  { data_type => "bigint", is_nullable => 0 },
  "creator_id",
  { data_type => "bigint", is_nullable => 0 },
  "leaf",
  { data_type => "tinyint", is_nullable => 0 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07000 @ 2011-10-29 01:07:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dp4Eb6K1VOz1BJgLykJujg


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->has_many(
    "description",
    "Alproute::Model::DBIx::Result::Description",
    { "foreign.location_id" => "self.id" },
    { cascade_copy => 0, cascade_delete => 0 },
);
1;
