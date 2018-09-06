require 'rails_helper'

feature 'Manually create a todo item from issue', :js do
  let!(:project) { create(:project) }
  let!(:issue)   { create(:issue, project: project) }
  let!(:user)    { create(:user)}

  before do
    project.add_master(user)
    sign_in(user)
    visit project_issue_path(project, issue)
  end

  it 'creates todo when clicking button' 


  it 'marks a todo as done' 

end

