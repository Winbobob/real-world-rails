require "spec_helper"

describe Files::UpdateService do
  subject { described_class.new(project, user, commit_params) }

  let(:project) { create(:project, :repository) }
  let(:user) { create(:user, :commit_email) }
  let(:file_path) { 'files/ruby/popen.rb' }
  let(:new_contents) { 'New Content' }
  let(:branch_name) { project.default_branch }
  let(:last_commit_sha) { nil }
  let(:commit) { project.repository.commit }

  let(:commit_params) do
    {
      file_path: file_path,
      commit_message: "Update File",
      file_content: new_contents,
      file_content_encoding: "text",
      last_commit_sha: last_commit_sha,
      start_project: project,
      start_branch: project.default_branch,
      branch_name: branch_name
    }
  end

  before do
    project.add_maintainer(user)
  end

  describe "#execute" do
    context "when the file's last commit sha does not match the supplied last_commit_sha" do
      let(:last_commit_sha) { "foo" }

      it "returns a hash with the correct error message and a :error status " 

    end

    context "when the file's last commit sha does match the supplied last_commit_sha" do
      let(:last_commit_sha) { Gitlab::Git::Commit.last_for_path(project.repository, project.default_branch, file_path).sha }

      it "returns a hash with the :success status " 


      it "updates the file with the new contents" 


      it 'uses the commit email' 

    end

    context "when the last_commit_sha is not supplied" do
      it "returns a hash with the :success status " 


      it "updates the file with the new contents" 

    end
  end
end

