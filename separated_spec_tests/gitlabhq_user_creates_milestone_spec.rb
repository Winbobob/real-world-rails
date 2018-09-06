require "rails_helper"

describe "User creates milestone", :js do
  set(:user) { create(:user) }
  set(:project) { create(:project) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit(new_project_milestone_path(project))
  end

  it "creates milestone" 

end

