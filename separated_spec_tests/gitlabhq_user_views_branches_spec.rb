require "spec_helper"

describe "User views branches" do
  set(:project) { create(:project, :repository) }
  set(:user) { project.owner }

  before do
    sign_in(user)
  end

  context "all branches" do
    before do
      visit(project_branches_path(project))
    end

    it "shows branches" 

  end

  context "protected branches" do
    set(:protected_branch) { create(:protected_branch, project: project) }

    before do
      visit(project_protected_branches_path(project))
    end

    it "shows branches" 

  end
end

