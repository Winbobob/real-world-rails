require 'rails_helper'

describe 'User creates branch and merge request on issue page', :js do
  let(:user) { create(:user) }
  let!(:project) { create(:project, :repository) }
  let(:issue) { create(:issue, project: project, title: 'Cherry-Coloured Funk') }

  context 'when signed out' do
    before do
      visit project_issue_path(project, issue)
    end

    it "doesn't show 'Create merge request' button" 

  end

  context 'when signed in' do
    before do
      project.add_developer(user)

      sign_in(user)
    end

    context 'when interacting with the dropdown' do
      before do
        visit project_issue_path(project, issue)
      end

      # In order to improve tests performance, all UI checks are placed in this test.
      it 'shows elements' 


      context 'when branch name is auto-generated' do
        it 'creates a merge request' 


        it 'creates a branch' 

      end

      context 'when branch name is custom' do
        let(:branch_name) { 'custom-branch-name' }

        it 'creates a merge request' 


        it 'creates a branch' 

      end
    end

    context "when there is a referenced merge request" do
      let!(:note) do
        create(:note, :on_issue, :system, project: project, noteable: issue,
                                          note: "mentioned in #{referenced_mr.to_reference}")
      end

      let(:referenced_mr) do
        create(:merge_request, :simple, source_project: project, target_project: project,
                                        description: "Fixes #{issue.to_reference}", author: user)
      end

      before do
        referenced_mr.cache_merge_request_closes_issues!(user)

        visit project_issue_path(project, issue)
      end

      it 'disables the create branch button' 

    end

    context 'when merge requests are disabled' do
      before do
        project.project_feature.update(merge_requests_access_level: 0)

        visit project_issue_path(project, issue)
      end

      it 'shows only create branch button' 

    end

    context 'when issue is confidential' do
      let(:issue) { create(:issue, :confidential, project: project) }

      it 'disables the create branch button' 

    end
  end

  private

  def select_dropdown_option(option, branch_name = nil)
    find('.create-mr-dropdown-wrap .dropdown-toggle').click
    find("li[data-value='#{option}']").click

    if branch_name
      find('.js-branch-name').set(branch_name)

      # Javascript debounces AJAX calls.
      # So we have to wait until AJAX requests are started.
      # Details are in app/assets/javascripts/create_merge_request_dropdown.js
      # this.refDebounce = _.debounce(...)
      sleep 0.5

      wait_for_requests
    end

    find('.js-create-merge-request').click
  end

  def test_branch_name_checking(input_branch_name)
    expect(input_branch_name.value).to eq(issue.to_branch_name)

    input_branch_name.set('new-branch-name')
    branch_name_message = find('.js-branch-message')

    expect(branch_name_message).to have_text('Checking branch name availability…')

    wait_for_requests

    expect(branch_name_message).to have_text('Branch name is available')

    input_branch_name.set(project.default_branch)

    expect(branch_name_message).to have_text('Checking branch name availability…')

    wait_for_requests

    expect(branch_name_message).to have_text('Branch is already taken')
  end

  def test_selection_mark(li_create_branch, li_create_merge_request, button_create_target, button_create_merge_request)
    page.within(li_create_merge_request) do
      expect(page).to have_css('i.fa.fa-check')
      expect(button_create_target).to have_text('Create merge request')
      expect(button_create_merge_request).to have_text('Create merge request')
    end

    li_create_branch.click

    page.within(li_create_branch) do
      expect(page).to have_css('i.fa.fa-check')
      expect(button_create_target).to have_text('Create branch')
      expect(button_create_merge_request).to have_text('Create branch')
    end
  end

  def test_source_checking(input_source)
    expect(input_source.value).to eq(project.default_branch)

    input_source.set('mas') # Intentionally entered first 3 letters of `master` to check autocomplete feature later.
    source_message = find('.js-ref-message')

    expect(source_message).to have_text('Checking source availability…')

    wait_for_requests

    expect(source_message).to have_text('Source is not available')

    # JavaScript gets refs started with `mas` (entered above) and places the first match.
    # User sees `mas` in black color (the part he entered) and the `ter` in gray color (a hint).
    # Since hinting is implemented via text selection and rspec/capybara doesn't have matchers for it,
    # we just checking the whole source name.
    expect(input_source.value).to eq(project.default_branch)
  end
end

