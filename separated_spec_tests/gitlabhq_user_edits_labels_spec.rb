require "spec_helper"

describe "User edits labels" do
  set(:project) { create(:project_empty_repo, :public) }
  set(:label) { create(:label, project: project) }
  set(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(edit_project_label_path(project, label))
  end

  it "updates label's title" 

end

