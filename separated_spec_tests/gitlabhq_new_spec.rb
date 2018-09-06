require 'spec_helper'

feature 'Creating a new project milestone', :js do
  let(:user) { create(:user) }
  let(:project) { create(:project, name: 'test', namespace: user.namespace) }

  before do
    login_as(user)
    visit new_project_milestone_path(project)
  end

  it 'description has autocomplete' 

end

