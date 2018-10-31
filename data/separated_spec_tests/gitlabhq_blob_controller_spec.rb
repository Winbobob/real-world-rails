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
      project.add_master(user)

      sign_in(user)
    end

    context 'when essential params are missing' do
      it 'renders nothing' 

    end

    context 'when essential params are present' do
      it 'renders the diff content' 

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

    context 'as master' do
      let(:master) { create(:user) }

      before do
        project.add_master(master)
        sign_in(master)
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
      project.add_master(user)

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
end

