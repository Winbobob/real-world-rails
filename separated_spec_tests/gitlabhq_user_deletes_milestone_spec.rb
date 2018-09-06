require "rails_helper"

describe "User deletes milestone", :js do
  set(:user) { create(:user) }
  set(:project) { create(:project) }
  set(:milestone) { create(:milestone, project: project) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit(project_milestones_path(project))
  end

  it "deletes milestone" 

end

