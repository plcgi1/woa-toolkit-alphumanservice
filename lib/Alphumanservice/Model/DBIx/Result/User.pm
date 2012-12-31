use utf8;
package Alphumanservice::Model::DBIx::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Alphumanservice::Model::DBIx::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'bigint'
  is_auto_increment: 1
  is_nullable: 0

=head2 login

  data_type: 'varchar'
  is_nullable: 0
  size: 50

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 created

  data_type: 'bigint'
  is_nullable: 0

=head2 updated

  data_type: 'bigint'
  is_nullable: 0

=head2 actions

  data_type: 'text'
  is_nullable: 1

=head2 siteid

  data_type: 'bigint'
  is_nullable: 0

=head2 roles

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "bigint", is_auto_increment => 1, is_nullable => 0 },
  "login",
  { data_type => "varchar", is_nullable => 0, size => 50 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "created",
  { data_type => "bigint", is_nullable => 0 },
  "updated",
  { data_type => "bigint", is_nullable => 0 },
  "actions",
  { data_type => "text", is_nullable => 1 },
  "siteid",
  { data_type => "bigint", is_nullable => 0 },
  "roles",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user_info_contacts

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserInfoContact>

=cut

__PACKAGE__->has_many(
  "user_info_contacts",
  "Alphumanservice::Model::DBIx::Result::UserInfoContact",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_info_discharges

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserInfoDischarge>

=cut

__PACKAGE__->has_many(
  "user_info_discharges",
  "Alphumanservice::Model::DBIx::Result::UserInfoDischarge",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_info_ensurances

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserInfoEnsurance>

=cut

__PACKAGE__->has_many(
  "user_info_ensurances",
  "Alphumanservice::Model::DBIx::Result::UserInfoEnsurance",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_info_passports

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserInfoPassport>

=cut

__PACKAGE__->has_many(
  "user_info_passports",
  "Alphumanservice::Model::DBIx::Result::UserInfoPassport",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_places

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserPlace>

=cut

__PACKAGE__->has_many(
  "user_places",
  "Alphumanservice::Model::DBIx::Result::UserPlace",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 user_sites

Type: has_many

Related object: L<Alphumanservice::Model::DBIx::Result::UserSite>

=cut

__PACKAGE__->has_many(
  "user_sites",
  "Alphumanservice::Model::DBIx::Result::UserSite",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07022 @ 2012-12-25 16:47:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MoaOz3ETMiEnfMXQF7y7PA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
