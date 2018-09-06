require "rails_helper"

describe "User views milestones" do
  set(:user) { create(:user) }
  set(:project) { create(:project) }
  set(:milestone) { create(:milestone, project: project) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit(project_milestones_path(project))
  end

  it "shows milestone" 


  context "with issues" do
    set(:issue) { create(:issue, project: project, milestone: milestone) }
    set(:closed_issue) { create(:closed_issue, project: project, milestone: milestone) }

    it "opens milestone" 

  end
end

