require 'rails_helper'

describe 'Issue Boards', :js do
  include BoardHelpers

  let(:user)         { create(:user) }
  let(:user2)        { create(:user) }
  let(:project)      { create(:project, :public) }
  let!(:milestone)   { create(:milestone, project: project) }
  let!(:development) { create(:label, project: project, name: 'Development') }
  let!(:bug)         { create(:label, project: project, name: 'Bug') }
  let!(:regression)  { create(:label, project: project, name: 'Regression') }
  let!(:stretch)     { create(:label, project: project, name: 'Stretch') }
  let!(:issue1)      { create(:labeled_issue, project: project, assignees: [user], milestone: milestone, labels: [development], relative_position: 2) }
  let!(:issue2)      { create(:labeled_issue, project: project, labels: [development, stretch], relative_position: 1) }
  let(:board)        { create(:board, project: project) }
  let!(:list)        { create(:list, board: board, label: development, position: 0) }
  let(:card) { find('.board:nth-child(2)').first('.card') }

  around do |example|
    Timecop.freeze { example.run }
  end

  before do
    project.add_master(user)

    sign_in(user)

    visit project_board_path(project, board)
    wait_for_requests
  end

  it 'shows sidebar when clicking issue' 


  it 'closes sidebar when clicking issue' 


  it 'closes sidebar when clicking close button' 


  it 'shows issue details when sidebar is open' 


  it 'removes card from board when clicking ' 


  it 'does not show remove button for backlog or closed issues' 


  context 'assignee' do
    it 'updates the issues assignee' 


    it 'removes the assignee' 


    it 'assignees to current user' 


    it 'updates assignee dropdown' 

  end

  context 'milestone' do
    it 'adds a milestone' 


    it 'removes a milestone' 

  end

  context 'due date' do
    it 'updates due date' 

  end

  context 'labels' do
    it 'shows current labels when editing' 


    it 'adds a single label' 


    it 'adds a multiple labels' 


    it 'removes a label' 


    it 'creates project label' 

  end

  context 'subscription' do
    it 'changes issue subscription' 


    it 'has checked subscription toggle when already subscribed' 

  end
end

