require "spec_helper"

describe "User creates branch", :js do
  include Spec::Support::Helpers::Features::BranchesHelpers

  let(:user) { create(:user) }
  let(:project) { create(:project, :repository) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit(new_project_branch_path(project))
  end

  it "creates new branch" 


  context "when branch name is invalid" do
    it "does not create new branch" 

  end

  context "when branch name already exists" do
    it "does not create new branch" 

  end
end

