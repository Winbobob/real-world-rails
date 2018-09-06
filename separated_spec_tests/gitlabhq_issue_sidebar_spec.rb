require 'rails_helper'

feature 'Issue Sidebar' do
  include MobileHelpers

  let(:group) { create(:group, :nested) }
  let(:project) { create(:project, :public, namespace: group) }
  let!(:user) { create(:user)}
  let!(:label) { create(:label, project: project, title: 'bug') }
  let(:issue) { create(:labeled_issue, project: project, labels: [label]) }
  let!(:xss_label) { create(:label, project: project, title: '&lt;script&gt;alert("xss");&lt;&#x2F;script&gt;') }

  before do
    sign_in(user)
  end

  context 'assignee', :js do
    let(:user2) { create(:user) }
    let(:issue2) { create(:issue, project: project, author: user2) }

    before do
      project.add_developer(user)
      visit_issue(project, issue2)

      find('.block.assignee .edit-link').click

      wait_for_requests
    end

    it 'shows author in assignee dropdown' 


    it 'shows author when filtering assignee dropdown' 


    it 'assigns yourself' 


    it 'keeps your filtered term after filtering and dismissing the dropdown' 

  end

  context 'as a allowed user' do
    before do
      project.add_developer(user)
      visit_issue(project, issue)
    end

    context 'sidebar', :js do
      it 'changes size when the screen size is smaller' 


      it 'escapes XSS when viewing issue labels' 

    end

    context 'editing issue labels', :js do
      before do
        issue.update_attributes(labels: [label])
        page.within('.block.labels') do
          find('.edit-link').click
        end
      end

      it 'shows the current set of labels' 


      it 'shows option to create a project label' 


      context 'creating a project label', :js do
        before do
          page.within('.block.labels') do
            click_link 'Create project'
          end
        end

        it 'shows dropdown switches to "create label" section' 


        it 'adds new label' 


        it 'shows error message if label title is taken' 

      end
    end

    context 'interacting with collapsed sidebar', :js do
      collapsed_sidebar_selector = 'aside.right-sidebar.right-sidebar-collapsed'
      expanded_sidebar_selector = 'aside.right-sidebar.right-sidebar-expanded'
      confidentiality_sidebar_block = '.block.confidentiality'
      lock_sidebar_block = '.block.lock'
      collapsed_sidebar_block_icon = '.sidebar-collapsed-icon'

      before do
        resize_screen_sm
      end

      it 'confidentiality block expands then collapses sidebar' 


      it 'lock block expands then collapses sidebar' 

    end
  end

  context 'as a guest' do
    before do
      project.add_guest(user)
      visit_issue(project, issue)
    end

    it 'does not have a option to edit labels' 

  end

  def visit_issue(project, issue)
    visit project_issue_path(project, issue)
  end

  def open_issue_sidebar
    find('aside.right-sidebar.right-sidebar-collapsed .js-sidebar-toggle').click
    find('aside.right-sidebar.right-sidebar-expanded')
  end
end

