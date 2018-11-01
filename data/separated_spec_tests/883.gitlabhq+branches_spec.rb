require 'spec_helper'

describe API::Branches do
  set(:user) { create(:user) }
  let(:project) { create(:project, :repository, creator: user, path: 'my.project') }
  let(:guest) { create(:user).tap { |u| project.add_guest(u) } }
  let(:branch_name) { 'feature' }
  let(:branch_sha) { '0b4bc9a49b562e85de7cc9e834518ea6828729b9' }
  let(:branch_with_dot) { project.repository.find_branch('ends-with.json') }
  let(:branch_with_slash) { project.repository.find_branch('improve/awesome') }

  let(:project_id) { project.id }
  let(:current_user) { nil }

  before do
    project.add_maintainer(user)
  end

  describe "GET /projects/:id/repository/branches" do
    let(:route) { "/projects/#{project_id}/repository/branches" }

    shared_examples_for 'repository branches' do
      it 'returns the repository branches' 


      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get api(route, current_user) }
        end
      end
    end

    context 'when search parameter is passed' do
      context 'and branch exists' do
        it 'returns correct branches' 

      end

      context 'and branch does not exist' do
        it 'returns an empty array' 

      end
    end

    context 'when unauthenticated', 'and project is public' do
      before do
        project.update(visibility_level: Gitlab::VisibilityLevel::PUBLIC)
      end

      it_behaves_like 'repository branches'
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'repository branches'

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'repository branches'
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get api(route, guest) }
      end
    end
  end

  describe "GET /projects/:id/repository/branches/:branch" do
    let(:route) { "/projects/#{project_id}/repository/branches/#{branch_name}" }

    shared_examples_for 'repository branch' do
      context 'HEAD request' do
        it 'returns 204 No Content' 


        it 'returns 404 Not Found' 

      end

      it 'returns the repository branch' 


      context 'when branch does not exist' do
        let(:branch_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
          let(:message) { '404 Branch Not Found' }
        end
      end

      context 'when the branch refname is invalid' do
        let(:branch_name) { 'branch*' }
        let(:message) { 'The branch refname is invalid' }

        it_behaves_like '400 response' do
          let(:request) { get api(route, current_user) }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get api(route, current_user) }
        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      before do
        project.update(visibility_level: Gitlab::VisibilityLevel::PUBLIC)
      end

      it_behaves_like 'repository branch'

      it 'returns that the current user cannot push' 

    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'repository branch'

      it 'returns that the current user can push' 


      context 'when branch contains a dot' do
        let(:branch_name) { branch_with_dot.name }

        it_behaves_like 'repository branch'
      end

      context 'when branch contains a slash' do
        let(:branch_name) { branch_with_slash.name }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
        end
      end

      context 'when branch contains an escaped slash' do
        let(:branch_name) { CGI.escape(branch_with_slash.name) }

        it_behaves_like 'repository branch'
      end

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'repository branch'

        context 'when branch contains a dot' do
          let(:branch_name) { branch_with_dot.name }

          it_behaves_like 'repository branch'
        end
      end
    end

    context 'when authenticated', 'as a developer and branch is protected' do
      let(:current_user) { create(:user) }
      let!(:protected_branch) { create(:protected_branch, project: project, name: branch_name) }

      before do
        project.add_developer(current_user)
      end

      it_behaves_like 'repository branch'

      it 'returns that the current user cannot push' 

    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { get api(route, guest) }
      end
    end
  end

  describe 'PUT /projects/:id/repository/branches/:branch/protect' do
    let(:route) { "/projects/#{project_id}/repository/branches/#{branch_name}/protect" }

    shared_examples_for 'repository new protected branch' do
      it 'protects a single branch' 


      it 'protects a single branch and developers can push' 


      it 'protects a single branch and developers can merge' 


      it 'protects a single branch and developers can push and merge' 


      context 'when branch does not exist' do
        let(:branch_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { put api(route, current_user) }
          let(:message) { '404 Branch Not Found' }
        end
      end

      context 'when the branch refname is invalid' do
        let(:branch_name) { 'branch*' }
        let(:message) { 'The branch refname is invalid' }

        it_behaves_like '400 response' do
          let(:request) { put api(route, current_user) }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { put api(route, current_user) }
        end
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { put api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { put api(route, guest) }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      context "when a protected branch doesn't already exist" do
        it_behaves_like 'repository new protected branch'

        context 'when branch contains a dot' do
          let(:branch_name) { branch_with_dot.name }

          it_behaves_like 'repository new protected branch'
        end

        context 'when branch contains a slash' do
          let(:branch_name) { branch_with_slash.name }

          it_behaves_like '404 response' do
            let(:request) { put api(route, current_user) }
          end
        end

        context 'when branch contains an escaped slash' do
          let(:branch_name) { CGI.escape(branch_with_slash.name) }

          it_behaves_like 'repository new protected branch'
        end

        context 'requesting with the escaped project full path' do
          let(:project_id) { CGI.escape(project.full_path) }

          it_behaves_like 'repository new protected branch'

          context 'when branch contains a dot' do
            let(:branch_name) { branch_with_dot.name }

            it_behaves_like 'repository new protected branch'
          end
        end
      end

      context 'when protected branch already exists' do
        before do
          project.repository.add_branch(user, protected_branch.name, 'master')
        end

        context 'when developers can push and merge' do
          let(:protected_branch) { create(:protected_branch, :developers_can_push, :developers_can_merge, project: project, name: 'protected_branch') }

          it 'updates that a developer cannot push or merge' 

        end

        context 'when developers cannot push or merge' do
          let(:protected_branch) { create(:protected_branch, project: project, name: 'protected_branch') }

          it 'updates that a developer can push and merge' 

        end
      end
    end
  end

  describe 'PUT /projects/:id/repository/branches/:branch/unprotect' do
    let(:route) { "/projects/#{project_id}/repository/branches/#{branch_name}/unprotect" }

    shared_examples_for 'repository unprotected branch' do
      it 'unprotects a single branch' 


      context 'when branch does not exist' do
        let(:branch_name) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { put api(route, current_user) }
          let(:message) { '404 Branch Not Found' }
        end
      end

      context 'when the branch refname is invalid' do
        let(:branch_name) { 'branch*' }
        let(:message) { 'The branch refname is invalid' }

        it_behaves_like '400 response' do
          let(:request) { put api(route, current_user) }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { put api(route, current_user) }
        end
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { put api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { put api(route, guest) }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      context "when a protected branch doesn't already exist" do
        it_behaves_like 'repository unprotected branch'

        context 'when branch contains a dot' do
          let(:branch_name) { branch_with_dot.name }

          it_behaves_like 'repository unprotected branch'
        end

        context 'when branch contains a slash' do
          let(:branch_name) { branch_with_slash.name }

          it_behaves_like '404 response' do
            let(:request) { put api(route, current_user) }
          end
        end

        context 'when branch contains an escaped slash' do
          let(:branch_name) { CGI.escape(branch_with_slash.name) }

          it_behaves_like 'repository unprotected branch'
        end

        context 'requesting with the escaped project full path' do
          let(:project_id) { CGI.escape(project.full_path) }

          it_behaves_like 'repository unprotected branch'

          context 'when branch contains a dot' do
            let(:branch_name) { branch_with_dot.name }

            it_behaves_like 'repository unprotected branch'
          end
        end
      end
    end
  end

  describe 'POST /projects/:id/repository/branches' do
    let(:route) { "/projects/#{project_id}/repository/branches" }

    shared_examples_for 'repository new branch' do
      it 'creates a new branch' 


      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { post api(route, current_user) }
        end
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { post api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a guest' do
      it_behaves_like '403 response' do
        let(:request) { post api(route, guest) }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      context "when a protected branch doesn't already exist" do
        it_behaves_like 'repository new branch'

        context 'requesting with the escaped project full path' do
          let(:project_id) { CGI.escape(project.full_path) }

          it_behaves_like 'repository new branch'
        end
      end
    end

    it 'returns 400 if branch name is invalid' 


    it 'returns 400 if branch already exists' 


    it 'returns 400 if ref name is invalid' 

  end

  describe 'DELETE /projects/:id/repository/branches/:branch' do
    before do
      allow_any_instance_of(Repository).to receive(:rm_branch).and_return(true)
    end

    it 'removes branch' 


    it 'removes a branch with dots in the branch name' 


    it 'returns 404 if branch not exists' 


    context 'when the branch refname is invalid' do
      let(:branch_name) { 'branch*' }
      let(:message) { 'The branch refname is invalid' }

      it_behaves_like '400 response' do
        let(:request) { delete api("/projects/#{project.id}/repository/branches/#{branch_name}", user) }
      end
    end

    it_behaves_like '412 response' do
      let(:request) { api("/projects/#{project.id}/repository/branches/#{branch_name}", user) }
    end
  end

  describe 'DELETE /projects/:id/repository/merged_branches' do
    before do
      allow_any_instance_of(Repository).to receive(:rm_branch).and_return(true)
    end

    it 'returns 202 with json body' 


    it 'returns a 403 error if guest' 

  end
end

