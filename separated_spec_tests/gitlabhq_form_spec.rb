require 'rails_helper'

describe 'New/edit issue', :js do
  include ActionView::Helpers::JavaScriptHelper
  include FormHelper

  let!(:project)   { create(:project) }
  let!(:user)      { create(:user)}
  let!(:user2)     { create(:user)}
  let!(:milestone) { create(:milestone, project: project) }
  let!(:label)     { create(:label, project: project) }
  let!(:label2)    { create(:label, project: project) }
  let!(:issue)     { create(:issue, project: project, assignees: [user], milestone: milestone) }

  before do
    project.add_master(user)
    project.add_master(user2)
    sign_in(user)
  end

  context 'new issue' do
    before do
      visit new_project_issue_path(project)
    end

    describe 'shorten users API pagination limit' do
      before do
        # Using `allow_any_instance_of`/`and_wrap_original`, `original` would
        # somehow refer to the very block we defined to _wrap_ that method, instead of
        # the original method, resulting in infinite recurison when called.
        # This is likely a bug with helper modules included into dynamically generated view classes.
        # To work around this, we have to hold on to and call to the original implementation manually.
        original_issue_dropdown_options = FormHelper.instance_method(:issue_assignees_dropdown_options)
        allow_any_instance_of(FormHelper).to receive(:issue_assignees_dropdown_options).and_wrap_original do |original, *args|
          options = original_issue_dropdown_options.bind(original.receiver).call(*args)
          options[:data][:per_page] = 2

          options
        end

        visit new_project_issue_path(project)

        click_button 'Unassigned'

        wait_for_requests
      end

      it 'should display selected users even if they are not part of the original API call' 

    end

    describe 'single assignee' do
      before do
        click_button 'Unassigned'

        wait_for_requests
      end

      it 'unselects other assignees when unassigned is selected' 


      it 'toggles assign to me when current user is selected and unselected' 

    end

    it 'allows user to create new issue' 


    it 'correctly updates the dropdown toggle when removing a label' 


    it 'clears label search input field when a label is selected' 


    it 'correctly updates the selected user when changing assignee' 


    it 'description has autocomplete' 


    describe 'milestone' do
      let!(:milestone) { create(:milestone, title: '">&lt;img src=x onerror=alert(document.domain)&gt;', project: project) }

      it 'escapes milestone' 

    end
  end

  context 'edit issue' do
    before do
      visit edit_project_issue_path(project, issue)
    end

    it 'allows user to update issue' 


    it 'description has autocomplete' 

  end

  context 'inline edit' do
    before do
      visit project_issue_path(project, issue)
    end

    it 'opens inline edit form with shortcut' 

  end

  describe 'sub-group project' do
    let(:group) { create(:group) }
    let(:nested_group_1) { create(:group, parent: group) }
    let(:sub_group_project) { create(:project, group: nested_group_1) }

    before do
      sub_group_project.add_master(user)

      visit new_project_issue_path(sub_group_project)
    end

    it 'creates project label from dropdown' 

  end

  def before_for_selector(selector)
    js = <<-JS.strip_heredoc
      (function(selector) {
        var el = document.querySelector(selector);
        return window.getComputedStyle(el, '::before').getPropertyValue('content');
      })("#{escape_javascript(selector)}")
    JS
    page.evaluate_script(js)
  end
end

