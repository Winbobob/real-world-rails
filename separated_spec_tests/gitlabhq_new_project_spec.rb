require 'spec_helper'

feature 'New project' do
  include Select2Helper

  let(:user) { create(:admin) }

  before do
    sign_in(user)
  end

  it 'shows "New project" page', :js do
    visit new_project_path

    expect(page).to have_content('Project path')
    expect(page).to have_content('Project name')

    find('#import-project-tab').click

    expect(page).to have_link('GitHub')
    expect(page).to have_link('Bitbucket')
    expect(page).to have_link('GitLab.com')
    expect(page).to have_link('Google Code')
    expect(page).to have_button('Repo by URL')
    expect(page).to have_link('GitLab export')
  end

  context 'Visibility level selector', :js do
    Gitlab::VisibilityLevel.options.each do |key, level|
      it "sets selector to #{key}" 


      it "saves visibility level #{level} on validation error" 

    end
  end

  context 'Namespace selector' do
    context 'with user namespace' do
      before do
        visit new_project_path
      end

      it 'selects the user namespace' 

    end

    context 'with group namespace' do
      let(:group) { create(:group, :private) }

      before do
        group.add_owner(user)
        visit new_project_path(namespace_id: group.id)
      end

      it 'selects the group namespace' 

    end

    context 'with subgroup namespace' do
      let(:group) { create(:group) }
      let(:subgroup) { create(:group, parent: group) }

      before do
        group.add_master(user)
        visit new_project_path(namespace_id: subgroup.id)
      end

      it 'selects the group namespace' 

    end

    context 'when changing namespaces dynamically', :js do
      let(:public_group) { create(:group, :public) }
      let(:internal_group) { create(:group, :internal) }
      let(:private_group) { create(:group, :private) }

      before do
        public_group.add_owner(user)
        internal_group.add_owner(user)
        private_group.add_owner(user)
        visit new_project_path(namespace_id: public_group.id)
      end

      it 'enables the correct visibility options' 

    end
  end

  context 'Import project options', :js do
    before do
      visit new_project_path
      find('#import-project-tab').click
    end

    context 'from git repository url, "Repo by URL"' do
      before do
        first('.js-import-git-toggle-button').click
      end

      it 'does not autocomplete sensitive git repo URL' 


      it 'shows import instructions' 


      it 'keeps "Import project" tab open after form validation error' 

    end

    context 'from GitHub' do
      before do
        first('.js-import-github').click
      end

      it 'shows import instructions' 

    end

    context 'from Google Code' do
      before do
        first('.import_google_code').click
      end

      it 'shows import instructions' 

    end
  end
end

