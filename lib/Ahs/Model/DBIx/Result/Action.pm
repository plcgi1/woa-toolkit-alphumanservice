use utf8;
package Ahs::Model::DBIx::Result::Action;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Ahs::Model::DBIx::Result::Action

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<action>

=cut

__PACKAGE__->table("action");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=head2 description

  data_type: 'varchar'
  is_nullable: 0
  size: 125

=head2 path

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 method_type

  data_type: 'varchar'
  is_nullable: 1
  size: 60

=head2 created

  data_type: 'bigint'
  is_nullable: 0

=head2 updated

  data_type: 'bigint'
  is_nullable: 0

=head2 type

  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 siteid

  data_type: 'bigint'
  is_nullable: 0

=head2 parentid

  data_type: 'bigint'
  is_nullable: 1

=head2 is_public

  data_type: 'tinyint'
  default_value: 0
  is_nullable: 1

=head2 order_by

  data_type: 'integer'
  default_value: 1
  is_nullable: 1

=head2 place

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 30 },
  "description",
  { data_type => "varchar", is_nullable => 0, size => 125 },
  "path",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "method_type",
  { data_type => "varchar", is_nullable => 1, size => 60 },
  "created",
  { data_type => "bigint", is_nullable => 0 },
  "updated",
  { data_type => "bigint", is_nullable => 0 },
  "type",
  { data_type => "varchar", is_nullable => 0, size => 10 },
  "siteid",
  { data_type => "bigint", is_nullable => 0 },
  "parentid",
  { data_type => "bigint", is_nullable => 1 },
  "is_public",
  { data_type => "tinyint", default_value => 0, is_nullable => 1 },
  "order_by",
  { data_type => "integer", default_value => 1, is_nullable => 1 },
  "place",
  { data_type => "varchar", is_nullable => 1, size => 10 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<action_name_idx>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("action_name_idx", ["name"]);

=head1 RELATIONS

=head2 navigations

Type: has_many

Related object: L<Ahs::Model::DBIx::Result::Navigation>

=cut

__PACKAGE__->has_many(
  "navigations",
  "Ahs::Model::DBIx::Result::Navigation",
  { "foreign.action_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2013-03-06 00:54:13
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pg1Qv2XKtxf7ZSbH5gyGAw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
