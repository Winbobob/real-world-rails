require 'spec_helper'

RSpec.describe 'Dashboard Archived Project' do
  let(:user) { create :user }
  let(:project) { create :project}
  let(:archived_project) { create(:project, :archived) }

  before do
    project.add_master(user)
    archived_project.add_master(user)

    sign_in(user)

    visit dashboard_projects_path
  end

  it 'renders non archived projects' 


  it 'renders all projects' 


  it 'renders only archived projects' 


  it 'searchs archived projects', :js do
    click_button 'Last updated'
    click_link 'Show archived projects'

    expect(page).to have_link(project.name)
    expect(page).to have_link(archived_project.name)

    fill_in 'project-filter-form-field', with: archived_project.name

    find('#project-filter-form-field').native.send_keys :return

    expect(page).not_to have_link(project.name)
    expect(page).to have_link(archived_project.name)
  end
end
