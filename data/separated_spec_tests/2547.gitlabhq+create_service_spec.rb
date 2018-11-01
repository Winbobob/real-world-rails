require "spec_helper"

describe Files::CreateService do
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:user) { create(:user, :commit_email) }
  let(:file_content) { 'Test file content' }
  let(:branch_name) { project.default_branch }
  let(:start_branch) { branch_name }

  let(:commit_params) do
    {
      file_path: file_path,
      commit_message: "Update File",
      file_content: file_content,
      file_content_encoding: "text",
      start_project: project,
      start_branch: start_branch,
      branch_name: branch_name
    }
  end

  let(:commit) { repository.head_commit }

  subject { described_class.new(project, user, commit_params) }

  before do
    project.add_maintainer(user)
  end

  describe "#execute" do
    context 'when file matches LFS filter' do
      let(:file_path) { 'test_file.lfs' }
      let(:branch_name) { 'lfs' }

      context 'with LFS disabled' do
        it 'skips gitattributes check' 


        it "doesn't create LFS pointers" 

      end

      context 'with LFS enabled' do
        before do
          allow(project).to receive(:lfs_enabled?).and_return(true)
        end

        it 'creates an LFS pointer' 


        it "creates an LfsObject with the file's content" 


        it 'links the LfsObject to the project' 

      end
    end
  end

  context 'commit attribute' do
    let(:file_path) { 'test-commit-attributes.txt' }

    it 'uses the commit email' 

  end
end

