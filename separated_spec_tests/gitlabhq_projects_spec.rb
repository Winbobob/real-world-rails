require 'spec_helper'

feature 'Project' do
  include ProjectForksHelper

  describe 'creating from template' do
    let(:user)    { create(:user) }
    let(:template) { Gitlab::ProjectTemplate.find(:rails) }

    before do
      sign_in user
      visit new_project_path
    end

    it "allows creation from templates", :js do
      find('#create-from-template-tab').click
      find("label[for=#{template.name}]").click
      fill_in("project_path", with: template.name)

      page.within '#content-body' do
        click_button "Create project"
      end

      expect(page).to have_content template.name
    end
  end

  describe 'shows tip about push to create git command' do
    let(:user)    { create(:user) }

    before do
      sign_in user
      visit new_project_path
    end

    it 'shows the command in a popover', :js do
      page.within '.profile-settings-sidebar' do
        click_link 'Show command'
      end

      expect(page).to have_css('.popover .push-to-create-popover #push_to_create_tip')
      expect(page).to have_content 'Private projects can be created in your personal namespace with:'
    end
  end

  describe 'description' do
    let(:project) { create(:project, :repository) }
    let(:path)    { project_path(project) }

    before do
      sign_in(create(:admin))
    end

    it 'parses Markdown' 


    it 'passes through html-pipeline' 


    it 'sanitizes unwanted tags' 


    it 'permits `rel` attribute on links' 

  end

  describe 'remove forked relationship', :js do
    let(:user)    { create(:user) }
    let(:project) { fork_project(create(:project, :public), user, namespace_id: user.namespace) }

    before do
      sign_in user
      visit edit_project_path(project)
    end

    it 'removes fork' 

  end

  describe 'showing information about source of a project fork' do
    let(:user) { create(:user) }
    let(:base_project)  { create(:project, :public, :repository) }
    let(:forked_project) { fork_project(base_project, user, repository: true) }

    before do
      sign_in user
    end

    it 'shows a link to the source project when it is available' 


    it 'does not contain fork network information for the root project' 


    it 'shows the name of the deleted project when the source was deleted' 


    context 'a fork of a fork' do
      let(:fork_of_fork) { fork_project(forked_project, user, repository: true) }

      it 'links to the base project if the source project is removed' 

    end
  end

  describe 'removal', :js do
    let(:user)    { create(:user) }
    let(:project) { create(:project, namespace: user.namespace) }

    before do
      sign_in(user)
      project.add_master(user)
      visit edit_project_path(project)
    end

    it 'removes a project' 

  end

  describe 'tree view (default view is set to Files)' do
    let(:user) { create(:user, project_view: 'files') }
    let(:project) { create(:forked_project_with_submodules) }

    before do
      project.add_master(user)
      sign_in user
      visit project_path(project)
    end

    it 'has working links to files' 


    it 'has working links to directories' 


    it 'has working links to submodules' 

  end

  describe 'activity view' do
    let(:user) { create(:user, project_view: 'activity') }
    let(:project) { create(:project, :repository) }

    before do
      project.add_master(user)
      sign_in user
      visit project_path(project)
    end

    it 'loads activity', :js do
      expect(page).to have_selector('.event-item')
    end
  end

  def remove_with_confirm(button_text, confirm_with)
    click_button button_text
    fill_in 'confirm_name_input', with: confirm_with
    click_button 'Confirm'
  end
end

