# -*- coding: utf-8 -*-
require 'spec_helper'

shared_examples 'languages and percentages JSON response' do
  let(:expected_languages) { project.repository.languages.map { |language| language.values_at(:label, :value)}.to_h }

  it 'returns expected language values' 

end

describe API::Projects do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:admin) { create(:admin) }
  let(:project) { create(:project, :repository, namespace: user.namespace) }
  let(:project2) { create(:project, namespace: user.namespace) }
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
    builds_enabled: false,
    snippets_enabled: false)
  end
  let(:project_member2) do
    create(:project_member,
    user: user4,
    project: project3,
    access_level: ProjectMember::MAINTAINER)
  end
  let(:project4) do
    create(:project,
    name: 'third_project',
    path: 'third_project',
    creator_id: user4.id,
    namespace: user4.namespace)
  end

  describe 'GET /projects' do
    shared_examples_for 'projects response' do
      it 'returns an array of projects' 


      it 'returns the proper security headers' 

    end

    shared_examples_for 'projects response without N + 1 queries' do
      it 'avoids N + 1 queries' 

    end

    let!(:public_project) { create(:project, :public, name: 'public_project') }
    before do
      project
      project2
      project3
      project4
    end

    context 'when unauthenticated' do
      it_behaves_like 'projects response' do
        let(:filter) { { search: project.name } }
        let(:current_user) { user }
        let(:projects) { [project] }
      end

      it_behaves_like 'projects response without N + 1 queries' do
        let(:current_user) { nil }
      end
    end

    context 'when authenticated as regular user' do
      it_behaves_like 'projects response' do
        let(:filter) { {} }
        let(:current_user) { user }
        let(:projects) { [public_project, project, project2, project3] }
      end

      it_behaves_like 'projects response without N + 1 queries' do
        let(:current_user) { user }
      end

      context 'when some projects are in a group' do
        before do
          create(:project, :public, group: create(:group))
        end

        it_behaves_like 'projects response without N + 1 queries' do
          let(:current_user) { user }
          let(:additional_project) { create(:project, :public, group: create(:group)) }
        end
      end

      it 'includes the project labels as the tag_list' 


      it 'includes open_issues_count' 


      it 'does not include projects marked for deletion' 


      it 'does not include open_issues_count if issues are disabled' 


      context 'and with_issues_enabled=true' do
        it 'only returns projects with issues enabled' 

      end

      it "does not include statistics by default" 


      it "includes statistics if requested" 


      it "does not include license by default" 


      it "does not include license if requested" 


      context 'when external issue tracker is enabled' do
        let!(:jira_service) { create(:jira_service, project: project) }

        it 'includes open_issues_count' 


        it 'does not include open_issues_count if issues are disabled' 

      end

      context 'and with simple=true' do
        it 'returns a simplified version of all the projects' 

      end

      context 'and using archived' do
        let!(:archived_project) { create(:project, creator_id: user.id, namespace: user.namespace, archived: true) }

        it 'returns archived projects' 


        it 'returns non-archived projects' 


        it 'returns every project' 

      end

      context 'and using search' do
        it_behaves_like 'projects response' do
          let(:filter) { { search: project.name } }
          let(:current_user) { user }
          let(:projects) { [project] }
        end
      end

      context 'and membership=true' do
        it_behaves_like 'projects response' do
          let(:filter) { { membership: true } }
          let(:current_user) { user }
          let(:projects) { [project, project2, project3] }
        end
      end

      context 'and using the visibility filter' do
        it 'filters based on private visibility param' 


        it 'filters based on internal visibility param' 


        it 'filters based on public visibility param' 

      end

      context 'and using sorting' do
        it 'returns the correct order when sorted by id' 

      end

      context 'and with owned=true' do
        it 'returns an array of projects the user owns' 

      end

      context 'and with starred=true' do
        let(:public_project) { create(:project, :public) }

        before do
          project_member
          user3.update(starred_projects: [project, project2, project3, public_project])
        end

        it 'returns the starred projects viewable by the user' 

      end

      context 'and with all query parameters' do
        let!(:project5) { create(:project, :public, path: 'gitlab5', namespace: create(:namespace)) }
        let!(:project6) { create(:project, :public, namespace: user.namespace) }
        let!(:project7) { create(:project, :public, path: 'gitlab7', namespace: user.namespace) }
        let!(:project8) { create(:project, path: 'gitlab8', namespace: user.namespace) }
        let!(:project9) { create(:project, :public, path: 'gitlab9') }

        before do
          user.update(starred_projects: [project5, project7, project8, project9])
        end

        context 'including owned filter' do
          it 'returns only projects that satisfy all query parameters' 

        end

        context 'including membership filter' do
          before do
            create(:project_member,
                   user: user,
                   project: project5,
                   access_level: ProjectMember::MAINTAINER)
          end

          it 'returns only projects that satisfy all query parameters' 

        end
      end

      context 'and with min_access_level' do
        before do
          project2.add_maintainer(user2)
          project3.add_developer(user2)
          project4.add_reporter(user2)
        end

        it 'returns an array of groups the user has at least developer access' 

      end
    end

    context 'when authenticated as a different user' do
      it_behaves_like 'projects response' do
        let(:filter) { {} }
        let(:current_user) { user2 }
        let(:projects) { [public_project] }
      end

      context 'and with_issues_enabled=true' do
        it 'does not return private issue projects' 

      end
    end

    context 'when authenticated as admin' do
      it_behaves_like 'projects response' do
        let(:filter) { {} }
        let(:current_user) { admin }
        let(:projects) { Project.all }
      end
    end
  end

  describe 'POST /projects' do
    context 'maximum number of projects reached' do
      it 'does not create new project and respond with 403' 

    end

    it 'creates new project without path but with name and returns 201' 


    it 'creates new project without name but with path and returns 201' 


    it 'creates new project with name and path and returns 201' 


    it 'creates last project before reaching project limit' 


    it 'does not create new project without name or path and returns 400' 


    it "assigns attributes to project" 


    it 'sets a project as public' 


    it 'sets a project as internal' 


    it 'sets a project as private' 


    it 'creates a new project initialized with a README.md' 


    it 'sets tag list to a project' 


    it 'uploads avatar for project a project' 


    it 'sets a project as not allowing outdated diff discussions to automatically resolve' 


    it 'sets a project as allowing outdated diff discussions to automatically resolve' 


    it 'sets a project as allowing merge even if build fails' 


    it 'sets a project as allowing merge only if merge_when_pipeline_succeeds' 


    it 'sets a project as allowing merge even if discussions are unresolved' 


    it 'sets a project as allowing merge if only_allow_merge_if_all_discussions_are_resolved is nil' 


    it 'sets a project as allowing merge only if all discussions are resolved' 


    it 'sets the merge method of a project to rebase merge' 


    it 'rejects invalid values for merge_method' 


    it 'ignores import_url when it is nil' 


    context 'when a visibility level is restricted' do
      let(:project_param) { attributes_for(:project, visibility: 'public') }

      before do
        stub_application_setting(restricted_visibility_levels: [Gitlab::VisibilityLevel::PUBLIC])
      end

      it 'does not allow a non-admin to use a restricted visibility level' 


      it 'allows an admin to override restricted visibility settings' 

    end
  end

  describe 'GET /users/:user_id/projects/' do
    let!(:public_project) { create(:project, :public, name: 'public_project', creator_id: user4.id, namespace: user4.namespace) }

    it 'returns error when user not found' 


    it 'returns projects filtered by user' 


    it 'returns projects filtered by minimal access level' 

  end

  describe 'POST /projects/user/:id' do
    it 'creates new project without path but with name and return 201' 


    it 'creates new project with name and path and returns 201' 


    it 'responds with 400 on failure and not project' 


    it 'assigns attributes to project' 


    it 'sets a project as public' 


    it 'sets a project as internal' 


    it 'sets a project as private' 


    it 'sets a project as not allowing outdated diff discussions to automatically resolve' 


    it 'sets a project as allowing outdated diff discussions to automatically resolve' 


    it 'sets a project as allowing merge even if build fails' 


    it 'sets a project as allowing merge only if pipeline succeeds' 


    it 'sets a project as allowing merge even if discussions are unresolved' 


    it 'sets a project as allowing merge only if all discussions are resolved' 

  end

  describe "POST /projects/:id/uploads" do
    before do
      project
    end

    it "uploads the file and returns its info" 

  end

  describe 'GET /projects/:id' do
    context 'when unauthenticated' do
      it 'returns the public projects' 

    end

    context 'when authenticated' do
      before do
        project
        project_member
      end

      it 'returns a project by id' 


      it 'returns a group link with expiration date' 


      it 'returns a project by path name' 


      it 'returns a 404 error if not found' 


      it 'returns a 404 error if user is not a member' 


      it 'handles users with dots' 


      it 'exposes namespace fields' 


      it "does not include license fields by default" 


      it 'includes license fields when requested' 


      it "does not include statistics by default" 


      it "includes statistics if requested" 


      it "includes import_error if user can admin project" 


      it "does not include import_error if user cannot admin project" 


      it 'returns 404 when project is marked for deletion' 


      context 'links exposure' do
        it 'exposes related resources full URIs' 


        it 'filters related URIs when their feature is not enabled' 

      end

      describe 'permissions' do
        context 'all projects' do
          before do
            project.add_maintainer(user)
          end

          it 'contains permission information' 

        end

        context 'personal project' do
          it 'sets project access and returns 200' 

        end

        context 'group project' do
          let(:project2) { create(:project, group: create(:group)) }

          before do
            project2.group.add_owner(user)
          end

          it 'sets the owner and return 200' 

        end
      end
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

  describe 'fork management' do
    let(:project_fork_target) { create(:project) }
    let(:project_fork_source) { create(:project, :public) }
    let(:private_project_fork_source) { create(:project, :private) }

    describe 'POST /projects/:id/fork/:forked_from_id' do
      context 'user is a developer' do
        before do
          project_fork_target.add_developer(user)
        end

        it 'denies project to be forked from an existing project' 

      end

      it 'refreshes the forks count cache' 


      context 'user is maintainer' do
        before do
          project_fork_target.add_maintainer(user)
        end

        it 'allows project to be forked from an existing project' 


        it 'denies project to be forked from a private project' 

      end

      context 'user is admin' do
        it 'allows project to be forked from an existing project' 


        it 'allows project to be forked from a private project' 


        it 'refreshes the forks count cachce' 


        it 'fails if forked_from project which does not exist' 


        it 'fails with 409 if already forked' 

      end
    end

    describe 'DELETE /projects/:id/fork' do
      it "is not visible to users outside group" 


      context 'when users belong to project group' do
        let(:project_fork_target) { create(:project, group: create(:group)) }

        before do
          project_fork_target.group.add_owner user
          project_fork_target.group.add_developer user2
        end

        context 'for a forked project' do
          before do
            post api("/projects/#{project_fork_target.id}/fork/#{project_fork_source.id}", admin)
            project_fork_target.reload
            expect(project_fork_target.forked_from_project).to be_present
            expect(project_fork_target).to be_forked
          end

          it 'makes forked project unforked' 


          it_behaves_like '412 response' do
            let(:request) { api("/projects/#{project_fork_target.id}/fork", admin) }
          end
        end

        it 'is forbidden to non-owner users' 


        it 'is idempotent if not forked' 

      end
    end

    describe 'GET /projects/:id/forks' do
      let(:private_fork) { create(:project, :private, :empty_repo) }
      let(:member) { create(:user) }
      let(:non_member) { create(:user) }

      before do
        private_fork.add_developer(member)
      end

      context 'for a forked project' do
        before do
          post api("/projects/#{private_fork.id}/fork/#{project_fork_source.id}", admin)
          private_fork.reload
          expect(private_fork.forked_from_project).to be_present
          expect(private_fork).to be_forked
          project_fork_source.reload
          expect(project_fork_source.forks.length).to eq(1)
          expect(project_fork_source.forks).to include(private_fork)
        end

        context 'for a user that can access the forks' do
          it 'returns the forks' 

        end

        context 'for a user that cannot access the forks' do
          it 'returns an empty array' 

        end
      end

      context 'for a non-forked project' do
        it 'returns an empty array' 

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
    context 'for a valid group' do
      let(:group) { create(:group, :public) }

      before do
        create(:project_group_link, group: group, project: project)
      end

      it 'returns 204 when deleting a group share' 


      it_behaves_like '412 response' do
        let(:request) { api("/projects/#{project.id}/share/#{group.id}", user) }
      end
    end

    it 'returns a 400 when group id is not an integer' 


    it 'returns a 404 error when group link does not exist' 


    it 'returns a 404 error when project does not exist' 

  end

  describe 'PUT /projects/:id' do
    before do
      expect(project).to be_persisted
      expect(user).to be_persisted
      expect(user3).to be_persisted
      expect(user4).to be_persisted
      expect(project3).to be_persisted
      expect(project4).to be_persisted
      expect(project_member2).to be_persisted
      expect(project_member).to be_persisted
    end

    it 'returns 400 when nothing sent' 


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


      it 'updates jobs_enabled' 


      it 'updates merge_method' 


      it 'rejects to update merge_method when merge_method is invalid' 


      it 'updates avatar' 

    end

    context 'when authenticated as project maintainer' do
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
        ::Projects::UpdateService.new(project, user, archived: true).execute
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
        ::Projects::UpdateService.new(project, user, archived: true).execute
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

  describe 'POST /projects/:id/unstar' do
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

  describe 'GET /projects/:id/languages' do
    context 'with an authorized user' do
      it_behaves_like 'languages and percentages JSON response' do
        let(:project) { project3 }
      end

      it 'returns not_found(404) for not existing project' 

    end

    context 'with not authorized user' do
      it 'returns not_found for existing but unauthorized project' 

    end

    context 'without user' do
      let(:project_public) { create(:project, :public, :repository) }

      it_behaves_like 'languages and percentages JSON response' do
        let(:project) { project_public }
      end

      it 'returns not_found for existing but unauthorized project' 

    end
  end

  describe 'DELETE /projects/:id' do
    context 'when authenticated as user' do
      it 'removes project' 


      it_behaves_like '412 response' do
        let(:success_status) { 202 }
        let(:request) { api("/projects/#{project.id}", user) }
      end

      it 'does not remove a project if not an owner' 


      it 'does not remove a non existing project' 


      it 'does not remove a project not attached to user' 

    end

    context 'when authenticated as admin' do
      it 'removes any existing project' 


      it 'does not remove a non existing project' 


      it_behaves_like '412 response' do
        let(:success_status) { 202 }
        let(:request) { api("/projects/#{project.id}", admin) }
      end
    end
  end

  describe 'POST /projects/:id/fork' do
    let(:project) do
      create(:project, :repository, creator: user, namespace: user.namespace)
    end
    let(:group) { create(:group) }
    let(:group2) do
      group = create(:group, name: 'group2_name')
      group.add_owner(user2)
      group
    end

    let(:group3) do
      group = create(:group, name: 'group3_name', parent: group2)
      group.add_owner(user2)
      group
    end

    before do
      project.add_reporter(user2)
    end

    context 'when authenticated' do
      it 'forks if user has sufficient access to project' 


      it 'forks if user is admin' 


      it 'fails on missing project access for the project to fork' 


      it 'fails if forked project exists in the user namespace' 


      it 'fails if project to fork from does not exist' 


      it 'forks with explicit own user namespace id' 


      it 'forks with explicit own user name as namespace' 


      it 'forks to another user when admin' 


      it 'fails if trying to fork to another user when not admin' 


      it 'fails if trying to fork to non-existent namespace' 


      it 'forks to owned group' 


      it 'forks to owned subgroup' 


      it 'fails to fork to not owned group' 


      it 'forks to not owned group when admin' 

    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end
  end

  describe 'POST /projects/:id/housekeeping' do
    let(:housekeeping) { Projects::HousekeepingService.new(project) }

    before do
      allow(Projects::HousekeepingService).to receive(:new).with(project).and_return(housekeeping)
    end

    context 'when authenticated as owner' do
      it 'starts the housekeeping process' 


      context 'when housekeeping lease is taken' do
        it 'returns conflict' 

      end
    end

    context 'when authenticated as developer' do
      before do
        project_member
      end

      it 'returns forbidden error' 

    end

    context 'when unauthenticated' do
      it 'returns authentication error' 

    end
  end

  describe 'PUT /projects/:id/transfer' do
    context 'when authenticated as owner' do
      let(:group) { create :group }

      it 'transfers the project to the new namespace' 


      it 'fails when transferring to a non owned namespace' 


      it 'fails when transferring to an unknown namespace' 


      it 'fails on missing namespace' 

    end
  end

  it_behaves_like 'custom attributes endpoints', 'projects' do
    let(:attributable) { project }
    let(:other_attributable) { project2 }
  end
end

