require "spec_helper"

describe "User deletes branch", :js do
  set(:user) { create(:user) }
  set(:project) { create(:project, :repository) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit(project_branches_path(project))
  end

  it "deletes branch" 

end

