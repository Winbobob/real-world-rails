require 'spec_helper'

describe 'User interacts with awards in an issue', :js do
  let(:issue) { create(:issue, project: project)}
  let(:project) { create(:project) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)

    visit(project_issue_path(project, issue))
  end

  it 'toggles the thumbsup award emoji' 


  it 'toggles a custom award emoji' 


  it 'shows the list of award emoji categories' 


  it 'adds an award emoji by a comment' 


  context 'when a project is archived' do
    let(:project) { create(:project, :archived) }

    it 'hides the add award button' 

  end

  context 'awards on a note' do
    let!(:note) { create(:note, noteable: issue, project: issue.project) }
    let!(:award_emoji) { create(:award_emoji, awardable: note, name: '100') }

    it 'shows the award on the note' 


    it 'allows adding a vote to an award' 


    it 'allows adding a new emoji' 


    context 'when the project is archived' do
      let(:project) { create(:project, :archived) }

      it 'hides the buttons for adding new emoji' 


      it 'does not allow toggling existing emoji' 

    end
  end
end

