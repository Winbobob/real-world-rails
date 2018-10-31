require 'rails_helper'

describe Projects::BlobController do
  include ProjectForksHelper

  let(:project) { create(:project, :public, :repository) }

  describe "GET show" do
    render_views

    context 'with file path' do
      before do
        get(:show,
            namespace_id: project.namespace,
            project_id: project,
            id: id)
      end

      context "valid branch, valid file" do
        let(:id) { 'master/README.md' }
        it { is_expected.to respond_with(:success) }
      end

      context "valid branch, invalid file" do
        let(:id) { 'master/invalid-path.rb' }
        it { is_expected.to respond_with(:not_found) }
      end

      context "invalid branch, valid file" do
        let(:id) { 'invalid-branch/README.md' }
        it { is_expected.to respond_with(:not_found) }
      end

      context "binary file" do
        let(:id) { 'binary-encoding/encoding/binary-1.bin' }
        it { is_expected.to respond_with(:success) }
      end
    end

    context 'with file path and JSON format' do
      context "valid branch, valid file" do
        let(:id) { 'master/README.md' }

        before do
          get(:show,
              namespace_id: project.namespace,
              project_id: project,
              id: id,
              format: :json)
        end

        it do
          expect(response).to be_ok
          expect(json_response).to have_key 'html'
          expect(json_response).to have_key 'raw_path'
        end
      end

      context "with viewer=none" do
        let(:id) { 'master/README.md' }

        before do
          get(:show,
              namespace_id: project.namespace,
              project_id: project,
              id: id,
              format: :json,
              viewer: 'none')
        end

        it do
          expect(response).to be_ok
          expect(json_response).not_to have_key 'html'
          expect(json_response).to have_key 'raw_path'
        end
      end
    end

    context 'with tree path' do
      before do
        get(:show,
            namespace_id: project.namespace,
            project_id: project,
            id: id)
        controller.instance_variable_set(:@blob, nil)
      end

      context 'redirect to tree' do
        let(:id) { 'markdown/doc' }
        it 'redirects' 

      end
    end
  end

  describe 'GET diff' do
    let(:user) { create(:user) }

    render_views

    def do_get(opts = {})
      params = { namespace_id: project.namespace,
                 project_id: project,
                 id: 'master/CHANGELOG' }
      get :diff, params.merge(opts)
    end

    before do
      project.add_maintainer(user)

      sign_in(user)
    end

    context 'when essential params are missing' do
      it 'renders nothing' 

    end

    context 'when essential params are present' do
      context 'when rendering for commit' do
        it 'renders the diff content' 

      end

      context 'when rendering for merge request' do
        it 'renders diff context lines Gitlab::Diff::Line array' 


        context 'when rendering match lines' do
          it 'adds top match line when "since" is less than 1' 


          it 'does not add top match line when when "since" is equal 1' 


          it 'adds bottom match line when "t"o is less than blob size' 


          it 'does not add bottom match line when "to" is less than blob size' 

        end
      end
    end
  end

  describe 'GET edit' do
    let(:default_params) do
      {
        namespace_id: project.namespace,
        project_id: project,
        id: 'master/CHANGELOG'
      }
    end

    context 'anonymous' do
      before do
        get :edit, default_params
      end

      it 'redirects to sign in and returns' 

    end

    context 'as guest' do
      let(:guest) { create(:user) }

      before do
        sign_in(guest)
        get :edit, default_params
      end

      it 'redirects to blob show' 

    end

    context 'as developer' do
      let(:developer) { create(:user) }

      before do
        project.add_developer(developer)
        sign_in(developer)
        get :edit, default_params
      end

      it 'redirects to blob show' 

    end

    context 'as maintainer' do
      let(:maintainer) { create(:user) }

      before do
        project.add_maintainer(maintainer)
        sign_in(maintainer)
        get :edit, default_params
      end

      it 'redirects to blob show' 

    end
  end

  describe 'PUT update' do
    let(:user) { create(:user) }
    let(:default_params) do
      {
        namespace_id: project.namespace,
        project_id: project,
        id: 'master/CHANGELOG',
        branch_name: 'master',
        content: 'Added changes',
        commit_message: 'Update CHANGELOG'
      }
    end

    def blob_after_edit_path
      project_blob_path(project, 'master/CHANGELOG')
    end

    before do
      project.add_maintainer(user)

      sign_in(user)
    end

    it 'redirects to blob' 


    context '?from_merge_request_iid' do
      let(:merge_request) { create(:merge_request, source_project: project, target_project: project) }
      let(:mr_params) { default_params.merge(from_merge_request_iid: merge_request.iid) }

      it 'redirects to MR diff' 


      context "when user doesn't have access" do
        before do
          other_project = create(:project, :repository)
          merge_request.update!(source_project: other_project, target_project: other_project)
        end

        it "it redirect to blob" 

      end
    end

    context 'when user has forked project' do
      let!(:forked_project) { fork_project(project, guest, namespace: guest.namespace, repository: true) }
      let(:guest) { create(:user) }

      before do
        sign_in(guest)
      end

      context 'when editing on the fork' do
        before do
          default_params[:namespace_id] = forked_project.namespace
          default_params[:project_id] = forked_project
        end

        it 'redirects to blob' 

      end

      context 'when editing on the original repository' do
        it "redirects to forked project new merge request" 

      end
    end
  end

  describe 'DELETE destroy' do
    let(:user) { create(:user) }
    let(:project_root_path) { project_tree_path(project, 'master') }

    before do
      project.add_maintainer(user)

      sign_in(user)
    end

    context 'for a file in a subdirectory' do
      let(:default_params) do
        {
          namespace_id: project.namespace,
          project_id: project,
          id: 'master/files/whitespace',
          original_branch: 'master',
          branch_name: 'master',
          commit_message: 'Delete whitespace'
        }
      end

      let(:after_delete_path) { project_tree_path(project, 'master/files') }

      it 'redirects to the sub directory' 

    end

    context 'if deleted file is the last one in a subdirectory' do
      let(:default_params) do
        {
          namespace_id: project.namespace,
          project_id: project,
          id: 'master/bar/branch-test.txt',
          original_branch: 'master',
          branch_name: 'master',
          commit_message: 'Delete whitespace'
        }
      end

      it 'redirects to the project root' 


      context 'when deleting a file in a branch other than master' do
        let(:default_params) do
          {
            namespace_id: project.namespace,
            project_id: project,
            id: 'binary-encoding/foo/bar/.gitkeep',
            original_branch: 'binary-encoding',
            branch_name: 'binary-encoding',
            commit_message: 'Delete whitespace'
          }
        end

        let(:after_delete_path) { project_tree_path(project, 'binary-encoding') }

        it 'redirects to the project root of the branch' 

      end
    end
  end
end

