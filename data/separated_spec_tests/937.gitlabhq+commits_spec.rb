require 'spec_helper'
require 'mime/types'

describe API::Commits do
  let(:user) { create(:user) }
  let(:guest) { create(:user).tap { |u| project.add_guest(u) } }
  let(:project) { create(:project, :repository, creator: user, path: 'my.project') }
  let(:branch_with_dot) { project.repository.find_branch('ends-with.json') }
  let(:branch_with_slash) { project.repository.find_branch('improve/awesome') }

  let(:project_id) { project.id }
  let(:current_user) { nil }

  before do
    project.add_maintainer(user)
  end

  describe 'GET /projects/:id/repository/commits' do
    let(:route) { "/projects/#{project_id}/repository/commits" }

    shared_examples_for 'project commits' do |schema: 'public_api/v4/commits'|
      it "returns project commits" 


      it 'include correct pagination headers' 

    end

    context 'when unauthenticated', 'and project is public' do
      let(:project) { create(:project, :public, :repository) }

      it_behaves_like 'project commits'
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'project commits'

      context "since optional parameter" do
        it "returns project commits since provided parameter" 


        it 'include correct pagination headers' 

      end

      context "until optional parameter" do
        it "returns project commits until provided parameter" 


        it 'include correct pagination headers' 

      end

      context "invalid xmlschema date parameters" do
        it "returns an invalid parameter error message" 

      end

      context "path optional parameter" do
        it "returns project commits matching provided path parameter" 


        it 'include correct pagination headers' 

      end

      context 'all optional parameter' do
        it 'returns all project commits' 

      end

      context 'with_stats optional parameter' do
        let(:project) { create(:project, :public, :repository) }

        it_behaves_like 'project commits', schema: 'public_api/v4/commits_with_stats' do
          let(:route) { "/projects/#{project_id}/repository/commits?with_stats=true" }

          it 'include commits details' 

        end
      end

      context 'with pagination params' do
        let(:page) { 1 }
        let(:per_page) { 5 }
        let(:ref_name) { 'master' }
        let!(:request) do
          get api("/projects/#{project_id}/repository/commits?page=#{page}&per_page=#{per_page}&ref_name=#{ref_name}", user)
        end

        it 'returns correct headers' 


        context 'viewing the first page' do
          it 'returns the first 5 commits' 

        end

        context 'viewing the third page' do
          let(:page) { 3 }

          it 'returns the third 5 commits' 

        end
      end
    end
  end

  describe "POST /projects/:id/repository/commits" do
    let!(:url) { "/projects/#{project_id}/repository/commits" }

    it 'returns a 403 unauthorized for user without permissions' 


    it 'returns a 400 bad request if no params are given' 


    describe 'create' do
      let(:message) { 'Created file' }
      let(:invalid_c_params) do
        {
          branch: 'master',
          commit_message: message,
          actions: [
            {
              action: 'create',
              file_path: 'files/ruby/popen.rb',
              content: 'puts 8'
            }
          ]
        }
      end
      let(:valid_c_params) do
        {
          branch: 'master',
          commit_message: message,
          actions: [
            {
              action: 'create',
              file_path: 'foo/bar/baz.txt',
              content: 'puts 8'
            }
          ]
        }
      end
      let(:valid_utf8_c_params) do
        {
          branch: 'master',
          commit_message: message,
          actions: [
            {
              action: 'create',
              file_path: 'foo/bar/baz.txt',
              content: 'puts 🦊'
            }
          ]
        }
      end

      it 'does not increment the usage counters using access token authentication' 


      it 'a new file in project repo' 


      it 'a new file with utf8 chars in project repo' 


      it 'returns a 400 bad request if file exists' 


      context 'with project path containing a dot in URL' do
        let(:url) { "/projects/#{CGI.escape(project.full_path)}/repository/commits" }

        it 'a new file in project repo' 

      end
    end

    describe 'delete' do
      let(:message) { 'Deleted file' }
      let(:invalid_d_params) do
        {
          branch: 'markdown',
          commit_message: message,
          actions: [
            {
              action: 'delete',
              file_path: 'doc/api/projects.md'
            }
          ]
        }
      end
      let(:valid_d_params) do
        {
          branch: 'markdown',
          commit_message: message,
          actions: [
            {
              action: 'delete',
              file_path: 'doc/api/users.md'
            }
          ]
        }
      end

      it 'an existing file in project repo' 


      it 'returns a 400 bad request if file does not exist' 

    end

    describe 'move' do
      let(:message) { 'Moved file' }
      let(:invalid_m_params) do
        {
          branch: 'feature',
          commit_message: message,
          actions: [
            {
              action: 'move',
              file_path: 'CHANGELOG',
              previous_path: 'VERSION',
              content: '6.7.0.pre'
            }
          ]
        }
      end
      let(:valid_m_params) do
        {
          branch: 'feature',
          commit_message: message,
          actions: [
            {
              action: 'move',
              file_path: 'VERSION.txt',
              previous_path: 'VERSION',
              content: '6.7.0.pre'
            }
          ]
        }
      end

      it 'an existing file in project repo' 


      it 'returns a 400 bad request if file does not exist' 

    end

    describe 'update' do
      let(:message) { 'Updated file' }
      let(:invalid_u_params) do
        {
          branch: 'master',
          commit_message: message,
          actions: [
            {
              action: 'update',
              file_path: 'foo/bar.baz',
              content: 'puts 8'
            }
          ]
        }
      end
      let(:valid_u_params) do
        {
          branch: 'master',
          commit_message: message,
          actions: [
            {
              action: 'update',
              file_path: 'files/ruby/popen.rb',
              content: 'puts 8'
            }
          ]
        }
      end

      it 'an existing file in project repo' 


      it 'returns a 400 bad request if file does not exist' 

    end

    describe 'chmod' do
      let(:message) { 'Chmod +x file' }
      let(:file_path) { 'files/ruby/popen.rb' }
      let(:execute_filemode) { true }
      let(:params) do
        {
          branch: 'master',
          commit_message: message,
          actions: [
            {
              action: 'chmod',
              file_path: file_path,
              execute_filemode: execute_filemode
            }
          ]
        }
      end

      it 'responds with success' 


      context 'when execute_filemode is false' do
        let(:execute_filemode) { false }

        it 'responds with success' 

      end

      context "when the file doesn't exists" do
        let(:file_path) { 'foo/bar.baz' }

        it "responds with 400" 

      end
    end

    describe 'multiple operations' do
      let(:message) { 'Multiple actions' }
      let(:invalid_mo_params) do
        {
          branch: 'master',
          commit_message: message,
          actions: [
            {
              action: 'create',
              file_path: 'files/ruby/popen.rb',
              content: 'puts 8'
            },
            {
              action: 'delete',
              file_path: 'doc/api/projects.md'
            },
            {
              action: 'move',
              file_path: 'CHANGELOG',
              previous_path: 'VERSION',
              content: '6.7.0.pre'
            },
            {
              action: 'update',
              file_path: 'foo/bar.baz',
              content: 'puts 8'
            },
            {
              action: 'chmod',
              file_path: 'files/ruby/popen.rb',
              execute_filemode: true
            }
          ]
        }
      end
      let(:valid_mo_params) do
        {
          branch: 'master',
          commit_message: message,
          actions: [
            {
              action: 'create',
              file_path: 'foo/bar/baz.txt',
              content: 'puts 8'
            },
            {
              action: 'delete',
              file_path: 'Gemfile.zip'
            },
            {
              action: 'move',
              file_path: 'VERSION.txt',
              previous_path: 'VERSION',
              content: '6.7.0.pre'
            },
            {
              action: 'update',
              file_path: 'files/ruby/popen.rb',
              content: 'puts 8'
            },
            {
              action: 'chmod',
              file_path: 'files/ruby/popen.rb',
              execute_filemode: true
            }
          ]
        }
      end

      it 'are commited as one in project repo' 


      it 'includes the commit stats' 


      it "doesn't include the commit stats when stats is false" 


      it 'return a 400 bad request if there are any issues' 

    end

    context 'when committing into a fork as a maintainer' do
      include_context 'merge request allowing collaboration'

      let(:project_id) { forked_project.id }

      def push_params(branch_name)
        {
          branch: branch_name,
          commit_message: 'Hello world',
          actions: [
            {
              action: 'create',
              file_path: 'foo/bar/baz.txt',
              content: 'puts 8'
            }
          ]
        }
      end

      it 'allows pushing to the source branch of the merge request' 


      it 'denies pushing to another branch' 

    end
  end

  describe 'GET /projects/:id/repository/commits/:sha/refs' do
    let(:project) { create(:project, :public, :repository) }
    let(:tag) { project.repository.find_tag('v1.1.0') }
    let(:commit_id) { tag.dereferenced_target.id }
    let(:route) { "/projects/#{project_id}/repository/commits/#{commit_id}/refs" }

    context 'when ref does not exist' do
      let(:commit_id) { 'unknown' }

      it_behaves_like '404 response' do
        let(:request) { get api(route, current_user) }
        let(:message) { '404 Commit Not Found' }
      end
    end

    context 'when repository is disabled' do
      include_context 'disabled repository'

      it_behaves_like '403 response' do
        let(:request) { get api(route, current_user) }
      end
    end

    context 'for a valid commit' do
      it 'returns all refs with no scope' 


      it 'returns all refs' 


      it 'returns the branch refs' 


      it 'returns the tag refs' 

    end
  end

  describe 'GET /projects/:id/repository/commits/:sha' do
    let(:commit) { project.repository.commit }
    let(:commit_id) { commit.id }
    let(:route) { "/projects/#{project_id}/repository/commits/#{commit_id}" }

    shared_examples_for 'ref commit' do
      it 'returns the ref last commit' 


      context 'when ref does not exist' do
        let(:commit_id) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
          let(:message) { '404 Commit Not Found' }
        end
      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { get api(route, current_user) }
        end
      end
    end

    context 'when stat param' do
      let(:route) { "/projects/#{project_id}/repository/commits/#{commit_id}" }

      it 'is not present return stats by default' 


      it "is false it does not include stats" 


      it "is true it includes stats" 

    end

    context 'when unauthenticated', 'and project is public' do
      let(:project) { create(:project, :public, :repository) }

      it_behaves_like 'ref commit'
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'ref commit'

      context 'when branch contains a dot' do
        let(:commit) { project.repository.commit(branch_with_dot.name) }
        let(:commit_id) { branch_with_dot.name }

        it_behaves_like 'ref commit'
      end

      context 'when branch contains a slash' do
        let(:commit_id) { branch_with_slash.name }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
        end
      end

      context 'when branch contains an escaped slash' do
        let(:commit) { project.repository.commit(branch_with_slash.name) }
        let(:commit_id) { CGI.escape(branch_with_slash.name) }

        it_behaves_like 'ref commit'
      end

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'ref commit'

        context 'when branch contains a dot' do
          let(:commit) { project.repository.commit(branch_with_dot.name) }
          let(:commit_id) { branch_with_dot.name }

          it_behaves_like 'ref commit'
        end
      end

      context 'when the ref has a pipeline' do
        let!(:pipeline) { project.pipelines.create(source: :push, ref: 'master', sha: commit.sha, protected: false) }

        it 'includes a "created" status' 


        context 'when pipeline succeeds' do
          before do
            pipeline.update(status: 'success')
          end

          it 'includes a "success" status' 

        end
      end
    end
  end

  describe 'GET /projects/:id/repository/commits/:sha/diff' do
    let(:commit) { project.repository.commit }
    let(:commit_id) { commit.id }
    let(:route) { "/projects/#{project_id}/repository/commits/#{commit_id}/diff" }

    shared_examples_for 'ref diff' do
      it 'returns the diff of the selected commit' 


      context 'when ref does not exist' do
        let(:commit_id) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
          let(:message) { '404 Commit Not Found' }
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
      let(:project) { create(:project, :public, :repository) }

      it_behaves_like 'ref diff'
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'ref diff'

      context 'when branch contains a dot' do
        let(:commit_id) { branch_with_dot.name }

        it_behaves_like 'ref diff'
      end

      context 'when branch contains a slash' do
        let(:commit_id) { branch_with_slash.name }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
        end
      end

      context 'when branch contains an escaped slash' do
        let(:commit_id) { CGI.escape(branch_with_slash.name) }

        it_behaves_like 'ref diff'
      end

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'ref diff'

        context 'when branch contains a dot' do
          let(:commit_id) { branch_with_dot.name }

          it_behaves_like 'ref diff'
        end
      end

      context 'when binary diff are treated as text' do
        let(:commit_id) { TestEnv::BRANCH_SHA['add-pdf-text-binary'] }

        it_behaves_like 'ref diff'
      end
    end
  end

  describe 'GET /projects/:id/repository/commits/:sha/comments' do
    let(:commit) { project.repository.commit }
    let(:commit_id) { commit.id }
    let(:route) { "/projects/#{project_id}/repository/commits/#{commit_id}/comments" }

    shared_examples_for 'ref comments' do
      context 'when ref exists' do
        before do
          create(:note_on_commit, author: user, project: project, commit_id: commit.id, note: 'a comment on a commit')
          create(:note_on_commit, author: user, project: project, commit_id: commit.id, note: 'another comment on a commit')
        end

        it 'returns the diff of the selected commit' 

      end

      context 'when ref does not exist' do
        let(:commit_id) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
          let(:message) { '404 Commit Not Found' }
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
      let(:project) { create(:project, :public, :repository) }

      it_behaves_like 'ref comments'
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { get api(route) }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as a maintainer' do
      let(:current_user) { user }

      it_behaves_like 'ref comments'

      context 'when branch contains a dot' do
        let(:commit) { project.repository.commit(branch_with_dot.name) }
        let(:commit_id) { branch_with_dot.name }

        it_behaves_like 'ref comments'
      end

      context 'when branch contains a slash' do
        let(:commit) { project.repository.commit(branch_with_slash.name) }
        let(:commit_id) { branch_with_slash.name }

        it_behaves_like '404 response' do
          let(:request) { get api(route, current_user) }
        end
      end

      context 'when branch contains an escaped slash' do
        let(:commit) { project.repository.commit(branch_with_slash.name) }
        let(:commit_id) { CGI.escape(branch_with_slash.name) }

        it_behaves_like 'ref comments'
      end

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'ref comments'

        context 'when branch contains a dot' do
          let(:commit) { project.repository.commit(branch_with_dot.name) }
          let(:commit_id) { branch_with_dot.name }

          it_behaves_like 'ref comments'
        end
      end
    end

    context 'when the commit is present on two projects' do
      let(:forked_project) { create(:project, :repository, creator: guest, namespace: guest.namespace) }
      let!(:forked_project_note) { create(:note_on_commit, author: guest, project: forked_project, commit_id: forked_project.repository.commit.id, note: 'a comment on a commit for fork') }
      let(:project_id) { forked_project.id }
      let(:commit_id) { forked_project.repository.commit.id }

      it 'returns the comments for the target project' 

    end
  end

  describe 'POST :id/repository/commits/:sha/cherry_pick' do
    let(:commit) { project.commit('7d3b0f7cff5f37573aea97cebfd5692ea1689924') }
    let(:commit_id) { commit.id }
    let(:branch) { 'master' }
    let(:route) { "/projects/#{project_id}/repository/commits/#{commit_id}/cherry_pick" }

    shared_examples_for 'ref cherry-pick' do
      context 'when ref exists' do
        it 'cherry-picks the ref commit' 

      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { post api(route, current_user), branch: 'master' }
        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      let(:project) { create(:project, :public, :repository) }

      it_behaves_like '403 response' do
        let(:request) { post api(route), branch: 'master' }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { post api(route), branch: 'master' }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as an owner' do
      let(:current_user) { user }

      it_behaves_like 'ref cherry-pick'

      context 'when ref does not exist' do
        let(:commit_id) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { post api(route, current_user), branch: 'master' }
          let(:message) { '404 Commit Not Found' }
        end
      end

      context 'when branch is missing' do
        it_behaves_like '400 response' do
          let(:request) { post api(route, current_user) }
        end
      end

      context 'when branch is empty' do
        ['', ' '].each do |branch|
          it_behaves_like '400 response' do
            let(:request) { post api(route, current_user), branch: branch }
          end
        end
      end

      context 'when branch does not exist' do
        it_behaves_like '404 response' do
          let(:request) { post api(route, current_user), branch: 'foo' }
          let(:message) { '404 Branch Not Found' }
        end
      end

      context 'when commit is already included in the target branch' do
        it_behaves_like '400 response' do
          let(:request) { post api(route, current_user), branch: 'markdown' }
        end
      end

      context 'when ref contains a dot' do
        let(:commit) { project.repository.commit(branch_with_dot.name) }
        let(:commit_id) { branch_with_dot.name }

        it_behaves_like 'ref cherry-pick'
      end

      context 'when ref contains a slash' do
        let(:commit_id) { branch_with_slash.name }

        it_behaves_like '404 response' do
          let(:request) { post api(route, current_user), branch: 'master' }
        end
      end

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'ref cherry-pick'

        context 'when ref contains a dot' do
          let(:commit) { project.repository.commit(branch_with_dot.name) }
          let(:commit_id) { branch_with_dot.name }

          it_behaves_like 'ref cherry-pick'
        end
      end
    end

    context 'when authenticated', 'as a developer' do
      let(:current_user) { guest }

      before do
        project.add_developer(guest)
      end

      context 'when branch is protected' do
        before do
          create(:protected_branch, project: project, name: 'feature')
        end

        it 'returns 400 if you are not allowed to push to the target branch' 

      end
    end

    context 'when cherry picking to a fork as a maintainer' do
      include_context 'merge request allowing collaboration'

      let(:project_id) { forked_project.id }

      it 'allows access from a maintainer that to the source branch' 


      it 'denies cherry picking to another branch' 

    end
  end

  describe 'POST /projects/:id/repository/commits/:sha/comments' do
    let(:commit) { project.repository.commit }
    let(:commit_id) { commit.id }
    let(:note) { 'My comment' }
    let(:route) { "/projects/#{project_id}/repository/commits/#{commit_id}/comments" }

    shared_examples_for 'ref new comment' do
      context 'when ref exists' do
        it 'creates the comment' 

      end

      context 'when repository is disabled' do
        include_context 'disabled repository'

        it_behaves_like '403 response' do
          let(:request) { post api(route, current_user), note: 'My comment' }
        end
      end
    end

    context 'when unauthenticated', 'and project is public' do
      let(:project) { create(:project, :public, :repository) }

      it_behaves_like '400 response' do
        let(:request) { post api(route), note: 'My comment' }
      end
    end

    context 'when unauthenticated', 'and project is private' do
      it_behaves_like '404 response' do
        let(:request) { post api(route), note: 'My comment' }
        let(:message) { '404 Project Not Found' }
      end
    end

    context 'when authenticated', 'as an owner' do
      let(:current_user) { user }

      it_behaves_like 'ref new comment'

      it 'returns the inline comment' 


      context 'when ref does not exist' do
        let(:commit_id) { 'unknown' }

        it_behaves_like '404 response' do
          let(:request) { post api(route, current_user), note: 'My comment' }
          let(:message) { '404 Commit Not Found' }
        end
      end

      it 'returns 400 if note is missing' 


      context 'when ref contains a dot' do
        let(:commit_id) { branch_with_dot.name }

        it_behaves_like 'ref new comment'
      end

      context 'when ref contains a slash' do
        let(:commit_id) { branch_with_slash.name }

        it_behaves_like '404 response' do
          let(:request) { post api(route, current_user), note: 'My comment' }
        end
      end

      context 'when ref contains an escaped slash' do
        let(:commit_id) { CGI.escape(branch_with_slash.name) }

        it_behaves_like 'ref new comment'
      end

      context 'requesting with the escaped project full path' do
        let(:project_id) { CGI.escape(project.full_path) }

        it_behaves_like 'ref new comment'

        context 'when ref contains a dot' do
          let(:commit_id) { branch_with_dot.name }

          it_behaves_like 'ref new comment'
        end
      end
    end
  end

  describe 'GET /projects/:id/repository/commits/:sha/merge_requests' do
    let!(:project) { create(:project, :repository, :private) }
    let!(:merged_mr) { create(:merge_request, source_project: project, source_branch: 'master', target_branch: 'feature') }
    let(:commit) { merged_mr.merge_request_diff.commits.last }

    it 'returns the correct merge request' 


    it 'returns 403 for an unauthorized user' 


    it 'responds 404 when the commit does not exist' 

  end
end

