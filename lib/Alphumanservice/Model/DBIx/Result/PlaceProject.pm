use utf8;
package Alphumanservice::Model::DBIx::Result::PlaceProject;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Alphumanservice::Model::DBIx::Result::PlaceProject

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<place_project>

=cut

__PACKAGE__->table("place_project");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 place_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 project_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "place_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "project_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 place

Type: belongs_to

Related object: L<Alphumanservice::Model::DBIx::Result::Place>

=cut

__PACKAGE__->belongs_to(
  "place",
  "Alphumanservice::Model::DBIx::Result::Place",
  { id => "place_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 project

Type: belongs_to

Related object: L<Alphumanservice::Model::DBIx::Result::Project>

=cut

__PACKAGE__->belongs_to(
  "project",
  "Alphumanservice::Model::DBIx::Result::Project",
  { id => "project_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 project_2

Type: belongs_to

Related object: L<Alphumanservice::Model::DBIx::Result::Project>

=cut

__PACKAGE__->belongs_to(
  "project_2",
  "Alphumanservice::Model::DBIx::Result::Project",
  { id => "project_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 project_3

Type: belongs_to

Related object: L<Alphumanservice::Model::DBIx::Result::Project>

=cut

__PACKAGE__->belongs_to(
  "project_3",
  "Alphumanservice::Model::DBIx::Result::Project",
  { id => "project_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-02-01 00:29:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PMKpPNyKGThInP0817JchQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
