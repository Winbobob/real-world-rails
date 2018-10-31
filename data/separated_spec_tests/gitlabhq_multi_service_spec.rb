require "spec_helper"

describe Files::MultiService do
  subject { described_class.new(project, user, commit_params) }

  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:user) { create(:user) }
  let(:branch_name) { project.default_branch }
  let(:original_file_path) { 'files/ruby/popen.rb' }
  let(:new_file_path) { 'files/ruby/popen.rb' }
  let(:file_content) { 'New content' }
  let(:action) { 'update' }

  let!(:original_commit_id) do
    Gitlab::Git::Commit.last_for_path(project.repository, branch_name, original_file_path).sha
  end

  let(:default_action) do
    {
      action: action,
      file_path: new_file_path,
      previous_path: original_file_path,
      content: file_content,
      last_commit_id: original_commit_id
    }
  end

  let(:actions) { [default_action] }

  let(:commit_params) do
    {
      commit_message: "Update File",
      branch_name: branch_name,
      start_branch: branch_name,
      actions: actions
    }
  end

  before do
    project.add_master(user)
  end

  describe '#execute' do
    context 'with a valid action' do
      it 'returns a hash with the :success status' 

    end

    context 'with an invalid action' do
      let(:action) { 'rename' }

      it 'returns a hash with the :error status' 

    end

    describe 'Updating files' do
      context 'when the file has been previously updated' do
        before do
          update_file(original_file_path)
        end

        it 'rejects the commit' 

      end

      context 'when the file have not been modified' do
        it 'accepts the commit' 

      end
    end

    context 'when moving a file' do
      let(:action) { 'move' }
      let(:new_file_path) { 'files/ruby/new_popen.rb' }

      context 'when original file has been updated' do
        before do
          update_file(original_file_path)
        end

        it 'rejects the commit' 

      end

      context 'when original file have not been updated' do
        it 'moves the file' 

      end
    end

    context 'when creating a file matching an LFS filter' do
      let(:action) { 'create' }
      let(:branch_name) { 'lfs' }
      let(:new_file_path) { 'test_file.lfs' }

      before do
        allow(project).to receive(:lfs_enabled?).and_return(true)
      end

      it 'creates an LFS pointer' 


      it "creates an LfsObject with the file's content" 


      context 'with base64 encoded content' do
        let(:raw_file_content) { 'Raw content' }
        let(:file_content) { Base64.encode64(raw_file_content) }
        let(:actions) { [default_action.merge(encoding: 'base64')] }

        it 'creates an LFS pointer' 


        it "creates an LfsObject with the file's content" 

      end

      it 'links the LfsObject to the project' 

    end

    context 'when file status validation is skipped' do
      let(:action) { 'create' }
      let(:new_file_path) { 'files/ruby/new_file.rb' }

      it 'does not check the last commit' 


      it 'creates the file' 

    end
  end

  def update_file(path)
    params = {
      file_path: path,
      start_branch: branch_name,
      branch_name: branch_name,
      commit_message: 'Update file',
      file_content: 'New content'
    }

    Files::UpdateService.new(project, user, params).execute
  end
end

