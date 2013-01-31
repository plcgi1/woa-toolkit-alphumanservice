use utf8;
package Alphumanservice::Model::DBIx::Result::Project;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Alphumanservice::Model::DBIx::Result::Project

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<project>

=cut

__PACKAGE__->table("project");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 created

  data_type: 'integer'
  is_nullable: 0

=head2 updated

  data_type: 'integer'
  is_nullable: 0

=head2 owner_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "created",
  { data_type => "integer", is_nullable => 0 },
  "updated",
  { data_type => "integer", is_nullable => 0 },
  "owner_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 goals

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::Goal>

=cut

__PACKAGE__->has_many(
  "goals",
  "Alphumanservice::Model::DBIx::Result::Goal",
  { "foreign.project_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 owner

Type: belongs_to

Related object: L<Alphumanservice::Model::DBIx::Result::User>

=cut

__PACKAGE__->belongs_to(
  "owner",
  "Alphumanservice::Model::DBIx::Result::User",
  { id => "owner_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 place_project_projects

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::PlaceProject>

=cut

__PACKAGE__->has_many(
  "place_project_projects",
  "Alphumanservice::Model::DBIx::Result::PlaceProject",
  { "foreign.project_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 place_project_projects_2s

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::PlaceProject>

=cut

__PACKAGE__->has_many(
  "place_project_projects_2s",
  "Alphumanservice::Model::DBIx::Result::PlaceProject",
  { "foreign.project_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 place_project_projects_3s

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::PlaceProject>

=cut

__PACKAGE__->has_many(
  "place_project_projects_3s",
  "Alphumanservice::Model::DBIx::Result::PlaceProject",
  { "foreign.project_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_projects

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserProject>

=cut

__PACKAGE__->has_many(
  "user_projects",
  "Alphumanservice::Model::DBIx::Result::UserProject",
  { "foreign.project_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-02-01 00:39:08
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZaeAOq1AkabHeCEKxYhzJg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
