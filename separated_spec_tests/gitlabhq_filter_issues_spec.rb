require 'spec_helper'

describe 'Filter issues', :js do
  include FilteredSearchHelpers

  let(:project) { create(:project) }

  # NOTE: The short name here is actually important
  #
  # When the name is longer, the filtered search input can end up scrolling
  # horizontally, and PhantomJS can't handle it.
  let(:user) { create(:user, name: 'Ann') }

  let!(:bug_label) { create(:label, project: project, title: 'bug') }
  let!(:caps_sensitive_label) { create(:label, project: project, title: 'CaPs') }
  let!(:multiple_words_label) { create(:label, project: project, title: "Two words") }
  let!(:milestone) { create(:milestone, title: "8", project: project, start_date: 2.days.ago) }

  def expect_no_issues_list
    page.within '.issues-list' do
      expect(page).to have_no_selector('.issue')
    end
  end

  before do
    project.add_master(user)

    user2 = create(:user)

    create(:issue, project: project, author: user2, title: "Bug report 1")
    create(:issue, project: project, author: user2, title: "Bug report 2")

    create(:issue, project: project, author: user,  title: "issue by assignee", milestone: milestone, assignees: [user])
    create(:issue, project: project, author: user,  title: "issue by assignee with searchTerm", milestone: milestone, assignees: [user])

    create(:labeled_issue,
      title: "Bug 2",
      project: project,
      milestone: milestone,
      author: user,
      assignees: [user],
      labels: [bug_label])

    create(:labeled_issue,
      title: "issue by assignee with searchTerm and label",
      project: project,
      milestone: milestone,
      author: user,
      assignees: [user],
      labels: [caps_sensitive_label])

    create(:labeled_issue,
      title: "Bug report foo was possible",
      project: project,
      milestone: milestone,
      author: user,
      assignees: [user],
      labels: [bug_label, caps_sensitive_label])

    create(:labeled_issue, title: "Issue with multiple words label", project: project, labels: [multiple_words_label])

    sign_in(user)
    visit project_issues_path(project)
  end

  it 'filters by all available tokens' 


  describe 'filter issues by author' do
    context 'only author' do
      it 'filters issues by searched author' 

    end
  end

  describe 'filter issues by assignee' do
    context 'only assignee' do
      it 'filters issues by searched assignee' 


      it 'filters issues by no assignee' 

    end
  end

  describe 'filter issues by label' do
    context 'only label' do
      it 'filters issues by searched label' 


      it 'filters issues by no label' 


      it 'filters issues by multiple labels' 


      it 'filters issues by label containing special characters' 


      it 'does not show issues for unused labels' 

    end

    context 'label with multiple words' do
      it 'special characters' 


      it 'single quotes' 


      it 'double quotes' 


      it 'single quotes containing double quotes' 


      it 'double quotes containing single quotes' 

    end

    context 'multiple labels with other filters' do
      it 'filters issues by searched label, label2, author, assignee, milestone and text' 

    end

    context 'issue label clicked' do
      it 'filters and displays in search bar' 

    end
  end

  describe 'filter issues by milestone' do
    context 'only milestone' do
      it 'filters issues by searched milestone' 


      it 'filters issues by no milestone' 


      it 'filters issues by upcoming milestones' 


      it 'filters issues by started milestones' 


      it 'filters issues by milestone containing special characters' 


      it 'does not show issues for unused milestones' 

    end
  end

  describe 'filter issues by text' do
    context 'only text' do
      it 'filters issues by searched text' 


      it 'filters issues by multiple searched text' 


      it 'filters issues by case insensitive searched text' 


      it 'filters issues by searched text containing single quotes' 


      it 'filters issues by searched text containing double quotes' 


      it 'filters issues by searched text containing special characters' 


      it 'does not show any issues' 

    end

    context 'searched text with other filters' do
      it 'filters issues by searched text, author, text, assignee, text, label1, text, label2, text, milestone and text' 

    end

    context 'sorting' do
      it 'sorts by created date' 

    end
  end

  describe 'switching issue states' do
    let!(:closed_issue) { create(:issue, :closed, project: project, title: 'closed bug') }

    before do
      input_filtered_search('bug')

      # This ensures that the search is performed
      expect_issues_list_count(4, 1)
    end

    it 'maintains filter' 

  end

  describe 'RSS feeds' do
    let(:group) { create(:group) }
    let(:project) { create(:project, group: group) }

    before do
      group.add_developer(user)
    end

    shared_examples 'updates atom feed link' do |type|
      it "for #{type}" 

    end

    it_behaves_like 'updates atom feed link', :project do
      let(:path) { project_issues_path(project, milestone_title: milestone.title, assignee_id: user.id) }
    end

    it_behaves_like 'updates atom feed link', :group do
      let(:path) { issues_group_path(group, milestone_title: milestone.title, assignee_id: user.id) }
    end
  end

  context 'URL has a trailing slash' do
    before do
      visit "#{project_issues_path(project)}/"
    end

    it 'milestone dropdown loads milestones' 


    it 'label dropdown load labels' 

  end
end

