require "spec_helper"

describe "User edits issue", :js do
  set(:project) { create(:project_empty_repo, :public) }
  set(:user) { create(:user) }
  set(:issue) { create(:issue, project: project, author: user) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit(edit_project_issue_path(project, issue))
  end

  it "previews content" 

end

