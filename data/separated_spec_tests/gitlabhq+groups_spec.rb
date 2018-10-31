require 'spec_helper'

describe API::Groups do
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
      it "returns public groups" 


      it 'avoids N+1 queries' 

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
      let(:group4) { create(:group, name: "same-name", path: "y#{group1.path}") }
      let(:group5) { create(:group, name: "same-name") }
      let(:response_groups) { json_response.map { |group| group['name'] } }
      let(:response_groups_ids) { json_response.map { |group| group['id'] } }

      before do
        group3.add_owner(user1)
        group4.add_owner(user1)
        group5.add_owner(user1)
      end

      it "sorts by name ascending by default" 


      it "sorts in descending order when passed" 


      it "sorts by path in order_by param" 


      it "sorts by id in the order_by param" 


      it "sorts also by descending id with pagination fix" 


      it "sorts identical keys by id for good pagination" 


      it "sorts descending identical keys by id for good pagination" 


      def groups_visible_to_user(user)
        Group.where(id: user.authorized_groups.select(:id).reorder(nil))
      end
    end

    context 'when using owned in the request' do
      it 'returns an array of groups the user owns' 

    end

    context 'when using min_access_level in the request' do
      let!(:group3) { create(:group, :private) }
      let(:response_groups) { json_response.map { |group| group['id'] } }

      before do
        group1.add_developer(user2)
        group3.add_master(user2)
      end

      it 'returns an array of groups the user has at least master access' 

    end
  end

  describe "GET /groups/:id" do
    # Given a group, create one project for each visibility level
    #
    # group      - Group to add projects to
    # share_with - If provided, each project will be shared with this Group
    #
    # Returns a Hash of visibility_level => Project pairs
    def add_projects_to_group(group, share_with: nil)
      projects = {
        public:   create(:project, :public,   namespace: group),
        internal: create(:project, :internal, namespace: group),
        private:  create(:project, :private,  namespace: group)
      }

      if share_with
        create(:project_group_link, project: projects[:public],   group: share_with)
        create(:project_group_link, project: projects[:internal], group: share_with)
        create(:project_group_link, project: projects[:private],  group: share_with)
      end

      projects
    end

    def response_project_ids(json_response, key)
      json_response[key].map do |project|
        project['id'].to_i
      end
    end

    context 'when unauthenticated' do
      it 'returns 404 for a private group' 


      it 'returns 200 for a public group' 


      it 'returns only public projects in the group' 


      it 'returns only public projects shared with the group' 

    end

    context "when authenticated as user" do
      it "returns one of user1's groups" 


      it "returns one of user1's groups without projects when with_projects option is set to false" 


      it "does not return a non existing group" 


      it "does not return a group not attached to user1" 


      it 'returns only public and internal projects in the group' 


      it 'returns only public and internal projects shared with the group' 

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


      it 'avoids N+1 queries' 

    end

    context 'when using group path in URL' do
      it 'returns any existing group' 


      it 'does not return a non existing group' 


      it 'does not return a group not attached to user1' 

    end
  end

  describe 'GET /groups/:id/subgroups', :nested_groups do
    let!(:subgroup1) { create(:group, parent: group1) }
    let!(:subgroup2) { create(:group, :private, parent: group1) }
    let!(:subgroup3) { create(:group, :private, parent: group2) }

    context 'when unauthenticated' do
      it 'returns only public subgroups' 


      it 'returns 404 for a private group' 

    end

    context 'when authenticated as user' do
      context 'when user is not member of a public group' do
        it 'returns no subgroups for the public group' 


        context 'when using all_available in request' do
          it 'returns public subgroups' 

        end
      end

      context 'when user is not member of a private group' do
        it 'returns 404 for the private group' 

      end

      context 'when user is member of public group' do
        before do
          group1.add_guest(user2)
        end

        it 'returns private subgroups' 


        context 'when using statistics in request' do
          it 'does not include statistics' 

        end
      end

      context 'when user is member of private group' do
        before do
          group2.add_guest(user1)
        end

        it 'returns subgroups' 

      end
    end

    context 'when authenticated as admin' do
      it 'returns private subgroups of a public group' 


      it 'returns subgroups of a private group' 


      it 'does not include statistics by default' 


      it 'includes statistics if requested' 

    end
  end

  describe "POST /groups" do
    context "when authenticated as user without group permissions" do
      it "does not create group" 


      context 'as owner', :nested_groups do
        before do
          group2.add_owner(user1)
        end

        it 'can create subgroups' 

      end

      context 'as maintainer', :nested_groups do
        before do
          group2.add_maintainer(user1)
        end

        it 'cannot create subgroups' 

      end
    end

    context "when authenticated as user with group permissions" do
      it "creates group" 


      it "creates a nested group", :nested_groups do
        parent = create(:group)
        parent.add_owner(user3)
        group = attributes_for(:group, { parent_id: parent.id })

        post api("/groups", user3), group

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


      it_behaves_like '412 response' do
        let(:request) { api("/groups/#{group1.id}", user1) }
        let(:success_status) { 202 }
      end

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

  it_behaves_like 'custom attributes endpoints', 'groups' do
    let(:attributable) { group1 }
    let(:other_attributable) { group2 }
    let(:user) { user1 }

    before do
      group2.add_owner(user1)
    end
  end
end

