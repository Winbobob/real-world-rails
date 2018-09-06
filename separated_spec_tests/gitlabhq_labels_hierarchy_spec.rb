require 'spec_helper'

feature 'Labels Hierarchy', :js, :nested_groups do
  include FilteredSearchHelpers

  let!(:user) { create(:user) }
  let!(:grandparent) { create(:group) }
  let!(:parent) { create(:group, parent: grandparent) }
  let!(:child) { create(:group, parent: parent) }
  let!(:project_1) { create(:project, namespace: parent) }

  let!(:grandparent_group_label) { create(:group_label, group: grandparent, title: 'Label_1') }
  let!(:parent_group_label) { create(:group_label, group: parent, title: 'Label_2') }
  let!(:child_group_label) { create(:group_label, group: child, title: 'Label_3') }
  let!(:project_label_1) { create(:label, project: project_1, title: 'Label_4') }

  before do
    grandparent.add_owner(user)

    sign_in(user)
  end

  shared_examples 'assigning labels from sidebar' do
    it 'can assign all ancestors labels' 


    it 'does not find child group labels on dropdown' 

  end

  shared_examples 'filtering by ancestor labels for projects' do |board = false|
    it 'filters by ancestor labels' 


    it 'does not filter by descendant group labels' 

  end

  shared_examples 'filtering by ancestor labels for groups' do |board = false|
    let(:project_2) { create(:project, namespace: parent) }
    let!(:project_label_2) { create(:label, project: project_2, title: 'Label_4') }

    let(:project_3) { create(:project, namespace: child) }
    let!(:group_label_3) { create(:group_label, group: child, title: 'Label_5') }
    let!(:project_label_3) { create(:label, project: project_3, title: 'Label_6') }

    let!(:labeled_issue_2) { create(:labeled_issue, project: project_2, labels: [grandparent_group_label, parent_group_label, project_label_2]) }
    let!(:labeled_issue_3) { create(:labeled_issue, project: project_3, labels: [grandparent_group_label, parent_group_label, group_label_3]) }

    let!(:issue_2) { create(:issue, project: project_2) }

    it 'filters by ancestors and current group labels' 


    it 'filters by descendant group labels' 


    it 'does not filter by descendant group project labels' 

  end

  context 'when creating new issuable' do
    before do
      visit new_project_issue_path(project_1)
    end

    it 'should be able to assign ancestor group labels' 

  end

  context 'issuable sidebar' do
    let!(:issue) { create(:issue, project: project_1) }

    context 'on issue sidebar' do
      before do
        project_1.add_developer(user)

        visit project_issue_path(project_1, issue)
      end

      it_behaves_like 'assigning labels from sidebar'
    end

    context 'on project board issue sidebar' do
      let(:board)   { create(:board, project: project_1) }

      before do
        project_1.add_developer(user)

        visit project_board_path(project_1, board)

        wait_for_requests

        find('.card').click
      end

      it_behaves_like 'assigning labels from sidebar'
    end

    context 'on group board issue sidebar' do
      let(:board)   { create(:board, group: parent) }

      before do
        parent.add_developer(user)

        visit group_board_path(parent, board)

        wait_for_requests

        find('.card').click
      end

      it_behaves_like 'assigning labels from sidebar'
    end
  end

  context 'issuable filtering' do
    let!(:labeled_issue) { create(:labeled_issue, project: project_1, labels: [grandparent_group_label, parent_group_label, project_label_1]) }
    let!(:issue) { create(:issue, project: project_1) }

    context 'on project issuable list' do
      before do
        project_1.add_developer(user)

        visit project_issues_path(project_1)
      end

      it_behaves_like 'filtering by ancestor labels for projects'

      it 'does not filter by descendant group labels' 

    end

    context 'on group issuable list' do
      before do
        visit issues_group_path(parent)
      end

      it_behaves_like 'filtering by ancestor labels for groups'
    end

    context 'on project boards filter' do
      let(:board) { create(:board, project: project_1) }

      before do
        project_1.add_developer(user)

        visit project_board_path(project_1, board)
      end

      it_behaves_like 'filtering by ancestor labels for projects', true
    end

    context 'on group boards filter' do
      let(:board) { create(:board, group: parent) }

      before do
        parent.add_developer(user)

        visit group_board_path(parent, board)
      end

      it_behaves_like 'filtering by ancestor labels for groups', true
    end
  end

  context 'creating boards lists' do
    context 'on project boards' do
      let(:board) { create(:board, project: project_1) }

      before do
        project_1.add_developer(user)
        visit project_board_path(project_1, board)
        find('.js-new-board-list').click
        wait_for_requests
      end

      it 'creates lists from all ancestor labels' 

    end

    context 'on group boards' do
      let(:board) { create(:board, group: parent) }

      before do
        parent.add_developer(user)
        visit group_board_path(parent, board)
        find('.js-new-board-list').click
        wait_for_requests
      end

      it 'creates lists from all ancestor group labels' 


      it 'does not create lists from descendant groups' 

    end
  end
end

