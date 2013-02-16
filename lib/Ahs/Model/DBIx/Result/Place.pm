use utf8;
package Ahs::Model::DBIx::Result::Place;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ahs::Model::DBIx::Result::Place

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<place>

=cut

__PACKAGE__->table("place");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 created

  data_type: 'bigint'
  is_nullable: 0

=head2 updated

  data_type: 'bigint'
  is_nullable: 0

=head2 lattitude

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 longtitude

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "created",
  { data_type => "bigint", is_nullable => 0 },
  "updated",
  { data_type => "bigint", is_nullable => 0 },
  "lattitude",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "longtitude",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 place_projects

Type: has_many

Related object: L<Ahs::Model::DBIx::Result::PlaceProject>

=cut

__PACKAGE__->has_many(
  "place_projects",
  "Ahs::Model::DBIx::Result::PlaceProject",
  { "foreign.place_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-02-10 00:53:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7AqjZxwYSk4kGhUpeEYsdw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
