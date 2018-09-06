require "rails_helper"

describe "User views milestone" do
  set(:user) { create(:user) }
  set(:project) { create(:project) }
  set(:milestone) { create(:milestone, project: project) }
  set(:labels) { create_list(:label, 2, project: project) }

  before do
    project.add_developer(user)
    sign_in(user)
  end

  it "avoids N+1 database queries" 


  private

  def visit_milestone
    visit(project_milestone_path(project, milestone))
  end
end

