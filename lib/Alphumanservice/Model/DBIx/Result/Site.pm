use utf8;
package Alphumanservice::Model::DBIx::Result::Site;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Alphumanservice::Model::DBIx::Result::Site

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<site>

=cut

__PACKAGE__->table("site");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 user_id

  data_type: 'bigint'
  is_nullable: 0

=head2 created

  data_type: 'bigint'
  is_nullable: 0

=head2 updated

  data_type: 'bigint'
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 token

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 url

  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "user_id",
  { data_type => "bigint", is_nullable => 0 },
  "created",
  { data_type => "bigint", is_nullable => 0 },
  "updated",
  { data_type => "bigint", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "token",
  { data_type => "varchar", is_nullable => 0, size => 255 },
  "url",
  { data_type => "varchar", is_nullable => 0, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user_places

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserPlace>

=cut

__PACKAGE__->has_many(
  "user_places",
  "Alphumanservice::Model::DBIx::Result::UserPlace",
  { "foreign.place_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_sites

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserSite>

=cut

__PACKAGE__->has_many(
  "user_sites",
  "Alphumanservice::Model::DBIx::Result::UserSite",
  { "foreign.site_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2012-12-25 16:47:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:c/cWrj5dnwf/QBwqaZHMng


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
