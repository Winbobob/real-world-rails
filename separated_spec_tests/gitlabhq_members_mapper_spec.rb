require 'spec_helper'

describe Gitlab::ImportExport::MembersMapper do
  describe 'map members' do
    let(:user) { create(:admin) }
    let(:project) { create(:project, :public, name: 'searchable_project') }
    let(:user2) { create(:user) }
    let(:exported_user_id) { 99 }
    let(:exported_members) do
      [{
         "id" => 2,
         "access_level" => 40,
         "source_id" => 14,
         "source_type" => "Project",
         "user_id" => 19,
         "notification_level" => 3,
         "created_at" => "2016-03-11T10:21:44.822Z",
         "updated_at" => "2016-03-11T10:21:44.822Z",
         "created_by_id" => nil,
         "invite_email" => nil,
         "invite_token" => nil,
         "invite_accepted_at" => nil,
         "user" =>
           {
             "id" => exported_user_id,
             "email" => user2.email,
             "username" => 'test'
           }
       },
       {
         "id" => 3,
         "access_level" => 40,
         "source_id" => 14,
         "source_type" => "Project",
         "user_id" => nil,
         "notification_level" => 3,
         "created_at" => "2016-03-11T10:21:44.822Z",
         "updated_at" => "2016-03-11T10:21:44.822Z",
         "created_by_id" => 1,
         "invite_email" => 'invite@test.com',
         "invite_token" => 'token',
         "invite_accepted_at" => nil
       }]
    end

    let(:members_mapper) do
      described_class.new(
        exported_members: exported_members, user: user, project: project)
    end

    it 'includes the exported user ID in the map' 


    it 'maps a project member' 


    it 'defaults to importer project member if it does not exist' 


    it 'has invited members with no user' 


    it 'authorizes the users to the project' 


    context 'user is not an admin' do
      let(:user) { create(:user) }

      it 'does not map a project member' 


      it 'defaults to importer project member if it does not exist' 

    end

    context 'chooses the one with an email first' do
      let(:user3) { create(:user, username: 'test') }

      it 'maps the project member that has a matching email first' 

    end

    context 'importer same as group member' do
      let(:user2) { create(:admin) }
      let(:group) { create(:group) }
      let(:project) { create(:project, :public, name: 'searchable_project', namespace: group) }
      let(:members_mapper) do
        described_class.new(
          exported_members: exported_members, user: user2, project: project)
      end

      before do
        group.add_users([user, user2], GroupMember::DEVELOPER)
      end

      it 'maps the project member' 


      it 'maps the project member if it already exists' 

    end

    context 'importing group members' do
      let(:group) { create(:group) }
      let(:project) { create(:project, namespace: group) }
      let(:members_mapper) do
        described_class.new(
          exported_members: exported_members, user: user, project: project)
      end

      before do
        group.add_users([user, user2], GroupMember::DEVELOPER)
        user.update(email: 'invite@test.com')
      end

      it 'maps the importer' 


      it 'maps the group member' 

    end
  end
end
