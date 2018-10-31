require 'spec_helper'

describe API::V3::Projects do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:admin) { create(:admin) }
  let(:project) { create(:project, creator_id: user.id, namespace: user.namespace) }
  let(:project2) { create(:project, creator_id: user.id, namespace: user.namespace) }
  let(:snippet) { create(:project_snippet, :public, author: user, project: project, title: 'example') }
  let(:project_member) { create(:project_member, :developer, user: user3, project: project) }
  let(:user4) { create(:user) }
  let(:project3) do
    create(:project,
    :private,
    :repository,
    name: 'second_project',
    path: 'second_project',
    creator_id: user.id,
    namespace: user.namespace,
    merge_requests_enabled: false,
    issues_enabled: false, wiki_enabled: false,
    snippets_enabled: false)
  end
  let(:project_member2) do
    create(:project_member,
    user: user4,
    project: project3,
    access_level: ProjectMember::MASTER)
  end
  let(:project4) do
    create(:project,
    name: 'third_project',
    path: 'third_project',
    creator_id: user4.id,
    namespace: user4.namespace)
  end

  describe 'GET /projects' do
    before { project }

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated as regular user' do
      it 'returns an array of projects' 


      it 'includes the project labels as the tag_list' 


      it 'includes open_issues_count' 


      it 'does not include open_issues_count' 


      context 'GET /projects?simple=true' do
        it 'returns a simplified version of all the projects' 

      end

      context 'and using search' do
        it 'returns searched project' 

      end

      context 'and using the visibility filter' do
        it 'filters based on private visibility param' 


        it 'filters based on internal visibility param' 


        it 'filters based on public visibility param' 

      end

      context 'and using archived' do
        let!(:archived_project) { create(:project, creator_id: user.id, namespace: user.namespace, archived: true) }

        it 'returns archived project' 


        it 'returns non-archived project' 


        it 'returns all project' 

      end

      context 'and using sorting' do
        before do
          project2
          project3
        end

        it 'returns the correct order when sorted by id' 

      end
    end
  end

  describe 'GET /projects/all' do
    before { project }

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated as regular user' do
      it 'returns authentication error' 

    end

    context 'when authenticated as admin' do
      it 'returns an array of all projects' 


      it "does not include statistics by default" 


      it "includes statistics if requested" 

    end
  end

  describe 'GET /projects/owned' do
    before do
      project3
      project4
    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated as project owner' do
      it 'returns an array of projects the user owns' 


      it "does not include statistics by default" 


      it "includes statistics if requested" 

    end
  end

  describe 'GET /projects/visible' do
    shared_examples_for 'visible projects response' do
      it 'returns the visible projects' 

    end

    let!(:public_project) { create(:project, :public) }
    before do
      project
      project2
      project3
      project4
    end

    context 'when unauthenticated' do
      it_behaves_like 'visible projects response' do
        let(:current_user) { nil }
        let(:projects) { [public_project] }
      end
    end

    context 'when authenticated' do
      it_behaves_like 'visible projects response' do
        let(:current_user) { user }
        let(:projects) { [public_project, project, project2, project3] }
      end
    end

    context 'when authenticated as a different user' do
      it_behaves_like 'visible projects response' do
        let(:current_user) { user2 }
        let(:projects) { [public_project] }
      end
    end
  end

  describe 'GET /projects/starred' do
    let(:public_project) { create(:project, :public) }

    before do
      project_member
      user3.update_attributes(starred_projects: [project, project2, project3, public_project])
    end

    it 'returns the starred projects viewable by the user' 

  end

  describe 'POST /projects' do
    context 'maximum number of projects reached' do
      it 'does not create new project and respond with 403' 

    end

    it 'creates new project without path but with name and returns 201' 


    it 'creates new project without name but with path and returns 201' 


    it 'creates new project name and path and returns 201' 


    it 'creates last project before reaching project limit' 


    it 'does not create new project without name or path and return 400' 


    it "assigns attributes to project" 


    it 'sets a project as public' 


    it 'sets a project as public using :public' 


    it 'sets a project as internal' 


    it 'sets a project as internal overriding :public' 


    it 'sets a project as private' 


    it 'sets a project as private using :public' 


    it 'sets a project as allowing merge even if build fails' 


    it 'sets a project as allowing merge only if merge_when_pipeline_succeeds' 


    it 'sets a project as allowing merge even if discussions are unresolved' 


    it 'sets a project as allowing merge if only_allow_merge_if_all_discussions_are_resolved is nil' 


    it 'sets a project as allowing merge only if all discussions are resolved' 


    context 'when a visibility level is restricted' do
      before do
        @project = attributes_for(:project, { public: true })
        stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])
      end

      it 'does not allow a non-admin to use a restricted visibility level' 


      it 'allows an admin to override restricted visibility settings' 

    end
  end

  describe 'POST /projects/user/:id' do
    before { project }
    before { admin }

    it 'should create new project without path and return 201' 


    it 'responds with 400 on failure and not project' 


    it 'assigns attributes to project' 


    it 'sets a project as public' 


    it 'sets a project as public using :public' 


    it 'sets a project as internal' 


    it 'sets a project as internal overriding :public' 


    it 'sets a project as private' 


    it 'sets a project as private using :public' 


    it 'sets a project as allowing merge even if build fails' 


    it 'sets a project as allowing merge only if merge_when_pipeline_succeeds' 


    it 'sets a project as allowing merge even if discussions are unresolved' 


    it 'sets a project as allowing merge only if all discussions are resolved' 

  end

  describe "POST /projects/:id/uploads" do
    before { project }

    it "uploads the file and returns its info" 

  end

  describe 'GET /projects/:id' do
    context 'when unauthenticated' do
      it 'returns the public projects' 

    end

    context 'when authenticated' do
      before do
        project
      end

      it 'returns a project by id' 


      it 'returns a project by path name' 


      it 'returns a 404 error if not found' 


      it 'returns a 404 error if user is not a member' 


      it 'handles users with dots' 


      it 'exposes namespace fields' 


      describe 'permissions' do
        context 'all projects' do
          before { project.add_master(user) }

          it 'contains permission information' 

        end

        context 'personal project' do
          it 'sets project access and returns 200' 

        end

        context 'group project' do
          let(:project2) { create(:project, group: create(:group)) }

          before { project2.group.add_owner(user) }

          it 'sets the owner and return 200' 

        end
      end
    end
  end

  describe 'GET /projects/:id/events' do
    shared_examples_for 'project events response' do
      it 'returns the project events' 

    end

    context 'when unauthenticated' do
      it_behaves_like 'project events response' do
        let(:project) { create(:project, :public) }
        let(:current_user) { nil }
      end
    end

    context 'when authenticated' do
      context 'valid request' do
        it_behaves_like 'project events response' do
          let(:current_user) { user }
        end
      end

      it 'returns a 404 error if not found' 


      it 'returns a 404 error if user is not a member' 

    end
  end

  describe 'GET /projects/:id/users' do
    shared_examples_for 'project users response' do
      it 'returns the project users' 

    end

    context 'when unauthenticated' do
      it_behaves_like 'project users response' do
        let(:project) { create(:project, :public) }
        let(:current_user) { nil }
      end
    end

    context 'when authenticated' do
      context 'valid request' do
        it_behaves_like 'project users response' do
          let(:current_user) { user }
        end
      end

      it 'returns a 404 error if not found' 


      it 'returns a 404 error if user is not a member' 

    end
  end

  describe 'GET /projects/:id/snippets' do
    before { snippet }

    it 'returns an array of project snippets' 

  end

  describe 'GET /projects/:id/snippets/:snippet_id' do
    it 'returns a project snippet' 


    it 'returns a 404 error if snippet id not found' 

  end

  describe 'POST /projects/:id/snippets' do
    it 'creates a new project snippet' 


    it 'returns a 400 error if invalid snippet is given' 

  end

  describe 'PUT /projects/:id/snippets/:snippet_id' do
    it 'updates an existing project snippet' 


    it 'updates an existing project snippet with new title' 

  end

  describe 'DELETE /projects/:id/snippets/:snippet_id' do
    before { snippet }

    it 'deletes existing project snippet' 


    it 'returns 404 when deleting unknown snippet id' 

  end

  describe 'GET /projects/:id/snippets/:snippet_id/raw' do
    it 'gets a raw project snippet' 


    it 'returns a 404 error if raw project snippet not found' 

  end

  describe 'fork management' do
    let(:project_fork_target) { create(:project) }
    let(:project_fork_source) { create(:project, :public) }

    describe 'POST /projects/:id/fork/:forked_from_id' do
      let(:new_project_fork_source) { create(:project, :public) }

      it "is not available for non admin users" 


      it 'allows project to be forked from an existing project' 


      it 'refreshes the forks count cachce' 


      it 'fails if forked_from project which does not exist' 


      it 'fails with 409 if already forked' 

    end

    describe 'DELETE /projects/:id/fork' do
      it "is not visible to users outside group" 


      context 'when users belong to project group' do
        let(:project_fork_target) { create(:project, group: create(:group)) }

        before do
          project_fork_target.group.add_owner user
          project_fork_target.group.add_developer user2
        end

        it 'is forbidden to non-owner users' 


        it 'makes forked project unforked' 


        it 'is idempotent if not forked' 

      end
    end
  end

  describe "POST /projects/:id/share" do
    let(:group) { create(:group) }

    it "shares project with group" 


    it "returns a 400 error when group id is not given" 


    it "returns a 400 error when access level is not given" 


    it "returns a 400 error when sharing is disabled" 


    it 'returns a 404 error when user cannot read group' 


    it 'returns a 404 error when group does not exist' 


    it "returns a 400 error when wrong params passed" 

  end

  describe 'DELETE /projects/:id/share/:group_id' do
    it 'returns 204 when deleting a group share' 


    it 'returns a 400 when group id is not an integer' 


    it 'returns a 404 error when group link does not exist' 


    it 'returns a 404 error when project does not exist' 

  end

  describe 'GET /projects/search/:query' do
    let!(:query)            { 'query'}
    let!(:search)           { create(:project, name: query, creator_id: user.id, namespace: user.namespace) }
    let!(:pre)              { create(:project, name: "pre_#{query}", creator_id: user.id, namespace: user.namespace) }
    let!(:post)             { create(:project, name: "#{query}_post", creator_id: user.id, namespace: user.namespace) }
    let!(:pre_post)         { create(:project, name: "pre_#{query}_post", creator_id: user.id, namespace: user.namespace) }
    let!(:unfound)          { create(:project, name: 'unfound', creator_id: user.id, namespace: user.namespace) }
    let!(:internal)         { create(:project, :internal, name: "internal #{query}") }
    let!(:unfound_internal) { create(:project, :internal, name: 'unfound internal') }
    let!(:public)           { create(:project, :public, name: "public #{query}") }
    let!(:unfound_public)   { create(:project, :public, name: 'unfound public') }
    let!(:one_dot_two)      { create(:project, :public, name: "one.dot.two") }

    shared_examples_for 'project search response' do |args = {}|
      it 'returns project search responses' 

    end

    context 'when unauthenticated' do
      it_behaves_like 'project search response', query: 'query', results: 1 do
        let(:current_user) { nil }
      end
    end

    context 'when authenticated' do
      it_behaves_like 'project search response', query: 'query', results: 6 do
        let(:current_user) { user }
      end
      it_behaves_like 'project search response', query: 'one.dot.two', results: 1 do
        let(:current_user) { user }
      end
    end

    context 'when authenticated as a different user' do
      it_behaves_like 'project search response', query: 'query', results: 2, match_regex: /(internal|public) query/ do
        let(:current_user) { user2 }
      end
    end
  end

  describe 'PUT /projects/:id' do
    before { project }
    before { user }
    before { user3 }
    before { user4 }
    before { project3 }
    before { project4 }
    before { project_member2 }
    before { project_member }

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated as project owner' do
      it 'updates name' 


      it 'updates visibility_level' 


      it 'updates visibility_level from public to private' 


      it 'does not update name to existing name' 


      it 'updates request_access_enabled' 


      it 'updates path & name to existing path & name in different namespace' 

    end

    context 'when authenticated as project master' do
      it 'updates path' 


      it 'updates other attributes' 


      it 'does not update path to existing path' 


      it 'does not update name' 


      it 'does not update visibility_level' 

    end

    context 'when authenticated as project developer' do
      it 'does not update other attributes' 

    end
  end

  describe 'POST /projects/:id/archive' do
    context 'on an unarchived project' do
      it 'archives the project' 

    end

    context 'on an archived project' do
      before do
        project.archive!
      end

      it 'remains archived' 

    end

    context 'user without archiving rights to the project' do
      before do
        project.add_developer(user3)
      end

      it 'rejects the action' 

    end
  end

  describe 'POST /projects/:id/unarchive' do
    context 'on an unarchived project' do
      it 'remains unarchived' 

    end

    context 'on an archived project' do
      before do
        project.archive!
      end

      it 'unarchives the project' 

    end

    context 'user without archiving rights to the project' do
      before do
        project.add_developer(user3)
      end

      it 'rejects the action' 

    end
  end

  describe 'POST /projects/:id/star' do
    context 'on an unstarred project' do
      it 'stars the project' 

    end

    context 'on a starred project' do
      before do
        user.toggle_star(project)
        project.reload
      end

      it 'does not modify the star count' 

    end
  end

  describe 'DELETE /projects/:id/star' do
    context 'on a starred project' do
      before do
        user.toggle_star(project)
        project.reload
      end

      it 'unstars the project' 

    end

    context 'on an unstarred project' do
      it 'does not modify the star count' 

    end
  end

  describe 'DELETE /projects/:id' do
    context 'when authenticated as user' do
      it 'removes project' 


      it 'does not remove a project if not an owner' 


      it 'does not remove a non existing project' 


      it 'does not remove a project not attached to user' 

    end

    context 'when authenticated as admin' do
      it 'removes any existing project' 


      it 'does not remove a non existing project' 

    end
  end
end

