require 'spec_helper'

feature 'Group' do
  before do
    sign_in(create(:admin))
  end

  matcher :have_namespace_error_message do
    match do |page|
      page.has_content?("Path can contain only letters, digits, '_', '-' and '.'. Cannot start with '-' or end in '.', '.git' or '.atom'.")
    end
  end

  describe 'create a group' do
    before do
      visit new_group_path
    end

    describe 'with space in group path' do
      it 'renders new group form with validation errors' 

    end

    describe 'with .atom at end of group path' do
      it 'renders new group form with validation errors' 

    end

    describe 'with .git at end of group path' do
      it 'renders new group form with validation errors' 

    end

    describe 'Mattermost team creation' do
      before do
        stub_mattermost_setting(enabled: mattermost_enabled)

        visit new_group_path
      end

      context 'Mattermost enabled' do
        let(:mattermost_enabled) { true }

        it 'displays a team creation checkbox' 


        it 'checks the checkbox by default' 


        it 'updates the team URL on graph path update', :js do
          out_span = find('span[data-bind-out="create_chat_team"]', visible: false)

          expect(out_span.text).to be_empty

          fill_in('group_path', with: 'test-group')

          expect(out_span.text).to eq('test-group')
        end
      end

      context 'Mattermost disabled' do
        let(:mattermost_enabled) { false }

        it 'doesnt show a team creation checkbox if Mattermost not enabled' 

      end
    end
  end

  describe 'create a nested group', :nested_groups, :js do
    let(:group) { create(:group, path: 'foo') }

    context 'as admin' do
      before do
        visit new_group_path(group, parent_id: group.id)
      end

      it 'creates a nested group' 

    end

    context 'as group owner' do
      it 'creates a nested group' 

    end
  end

  it 'checks permissions to avoid exposing groups by parent_id' 


  describe 'group edit', :js do
    let(:group) { create(:group) }
    let(:path)  { edit_group_path(group) }
    let(:new_name) { 'new-name' }

    before do
      visit path
    end

    it 'saves new settings' 


    it 'removes group' 

  end

  describe 'group page with markdown description' do
    let(:group) { create(:group) }
    let(:path)  { group_path(group) }

    it 'parses Markdown' 


    it 'passes through html-pipeline' 


    it 'sanitizes unwanted tags' 


    it 'permits `rel` attribute on links' 

  end

  describe 'group page with nested groups', :nested_groups, :js do
    let!(:group) { create(:group) }
    let!(:nested_group) { create(:group, parent: group) }
    let!(:project) { create(:project, namespace: group) }
    let!(:path)  { group_path(group) }

    it 'it renders projects and groups on the page' 

  end

  def remove_with_confirm(button_text, confirm_with)
    click_button button_text
    fill_in 'confirm_name_input', with: confirm_with
    click_button 'Confirm'
  end
end

