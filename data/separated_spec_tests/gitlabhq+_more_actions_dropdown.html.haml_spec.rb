require 'spec_helper'

describe 'projects/notes/_more_actions_dropdown' do
  let(:author_user) { create(:user) }
  let(:not_author_user) { create(:user) }

  let(:project) { create(:project) }
  let(:issue) { create(:issue, project: project) }
  let!(:note) { create(:note_on_issue, author: author_user, noteable: issue, project: project) }

  before do
    assign(:project, project)
  end

  it 'shows Report as abuse button if not editable and not current users comment' 


  it 'does not show the More actions button if not editable and current users comment' 


  it 'shows Report as abuse and Delete buttons if editable and not current users comment' 


  it 'shows Delete button if editable and current users comment' 

end

