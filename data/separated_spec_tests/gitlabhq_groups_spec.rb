require 'spec_helper'

describe API::V3::Groups do
  include UploadHelpers

  let(:user1) { create(:user, can_create_group: false) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:admin) { create(:admin) }
  let!(:group1) { create(:group, avatar: File.open(uploaded_image_temp_path)) }
  let!(:group2) { create(:group, :private) }
  let!(:project1) { create(:project, namespace: group1) }
  let!(:project2) { create(:project, namespace: group2) }
  let!(:project3) { create(:project, namespace: group1, path: 'test', visibility_level: Gitlab::VisibilityLevel::PRIVATE) }

  before do
    group1.add_owner(user1)
    group2.add_owner(user2)
  end

  describe "GET /groups" do
    context "when unauthenticated" do
      it "returns authentication error" 

    end

    context "when authenticated as user" do
      it "normal user: returns an array of groups of user1" 


      it "does not include statistics" 

    end

    context "when authenticated as admin" do
      it "admin: returns an array of all groups" 


      it "does not include statistics by default" 


      it "includes statistics if requested" 

    end

    context "when using skip_groups in request" do
      it "returns all groups excluding skipped groups" 

    end

    context "when using all_available in request" do
      let(:response_groups) { json_response.map { |group| group['name'] } }

      it "returns all groups you have access to" 

    end

    context "when using sorting" do
      let(:group3) { create(:group, name: "a#{group1.name}", path: "z#{group1.path}") }
      let(:response_groups) { json_response.map { |group| group['name'] } }

      before do
        group3.add_owner(user1)
      end

      it "sorts by name ascending by default" 


      it "sorts in descending order when passed" 


      it "sorts by the order_by param" 

    end
  end

  describe 'GET /groups/owned' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated as group owner' do
      it 'returns an array of groups the user owns' 

    end
  end

  describe "GET /groups/:id" do
    context "when authenticated as user" do
      it "returns one of user1's groups" 


      it "does not return a non existing group" 


      it "does not return a group not attached to user1" 

    end

    context "when authenticated as admin" do
      it "returns any existing group" 


      it "does not return a non existing group" 

    end

    context 'when using group path in URL' do
      it 'returns any existing group' 


      it 'does not return a non existing group' 


      it 'does not return a group not attached to user1' 

    end
  end

  describe 'PUT /groups/:id' do
    let(:new_group_name) { 'New Group'}

    context 'when authenticated as the group owner' do
      it 'updates the group' 


      it 'returns 404 for a non existing group' 

    end

    context 'when authenticated as the admin' do
      it 'updates the group' 

    end

    context 'when authenticated as an user that can see the group' do
      it 'does not updates the group' 

    end

    context 'when authenticated as an user that cannot see the group' do
      it 'returns 404 when trying to update the group' 

    end
  end

  describe "GET /groups/:id/projects" do
    context "when authenticated as user" do
      it "returns the group's projects" 


      it "returns the group's projects with simple representation" 


      it 'filters the groups projects' 


      it "does not return a non existing group" 


      it "does not return a group not attached to user1" 


      it "only returns projects to which user has access" 


      it 'only returns the projects owned by user' 


      it 'only returns the projects starred by user' 

    end

    context "when authenticated as admin" do
      it "returns any existing group" 


      it "does not return a non existing group" 

    end

    context 'when using group path in URL' do
      it 'returns any existing group' 


      it 'does not return a non existing group' 


      it 'does not return a group not attached to user1' 

    end
  end

  describe "POST /groups" do
    context "when authenticated as user without group permissions" do
      it "does not create group" 

    end

    context "when authenticated as user with group permissions" do
      it "creates group" 


      it "creates a nested group", :nested_groups do
        parent = create(:group)
        parent.add_owner(user3)
        group = attributes_for(:group, { parent_id: parent.id })

        post v3_api("/groups", user3), group

        expect(response).to have_gitlab_http_status(201)

        expect(json_response["full_path"]).to eq("#{parent.path}/#{group[:path]}")
        expect(json_response["parent_id"]).to eq(parent.id)
      end

      it "does not create group, duplicate" 


      it "returns 400 bad request error if name not given" 


      it "returns 400 bad request error if path not given" 

    end
  end

  describe "DELETE /groups/:id" do
    context "when authenticated as user" do
      it "removes group" 


      it "does not remove a group if not an owner" 


      it "does not remove a non existing group" 


      it "does not remove a group not attached to user1" 

    end

    context "when authenticated as admin" do
      it "removes any existing group" 


      it "does not remove a non existing group" 

    end
  end

  describe "POST /groups/:id/projects/:project_id" do
    let(:project) { create(:project) }
    let(:project_path) { CGI.escape(project.full_path) }

    before do
      allow_any_instance_of(Projects::TransferService)
        .to receive(:execute).and_return(true)
    end

    context "when authenticated as user" do
      it "does not transfer project to group" 

    end

    context "when authenticated as admin" do
      it "transfers project to group" 


      context 'when using project path in URL' do
        context 'with a valid project path' do
          it "transfers project to group" 

        end

        context 'with a non-existent project path' do
          it "does not transfer project to group" 

        end
      end

      context 'when using a group path in URL' do
        context 'with a valid group path' do
          it "transfers project to group" 

        end

        context 'with a non-existent group path' do
          it "does not transfer project to group" 

        end
      end
    end
  end
end

