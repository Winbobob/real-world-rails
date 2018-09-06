require "spec_helper"

describe "User comments on issue", :js do
  include Spec::Support::Helpers::Features::NotesHelpers

  let(:project) { create(:project_empty_repo, :public) }
  let(:issue) { create(:issue, project: project) }
  let(:user) { create(:user) }

  before do
    project.add_guest(user)
    sign_in(user)

    visit(project_issue_path(project, issue))
  end

  context "when adding comments" do
    it "adds comment" 


    it "adds comment with code block" 

  end

  context "when editing comments" do
    it "edits comment" 

  end
end

