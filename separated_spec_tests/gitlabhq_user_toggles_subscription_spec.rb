require "spec_helper"

describe "User toggles subscription", :js do
  let(:project) { create(:project_empty_repo, :public) }
  let(:user) { create(:user) }
  let(:issue) { create(:issue, project: project, author: user) }

  before do
    project.add_developer(user)
    sign_in(user)

    visit(project_issue_path(project, issue))
  end

  it "unsubscribes from issue" 

end

