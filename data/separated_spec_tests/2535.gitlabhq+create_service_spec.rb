require 'spec_helper'

describe Boards::Issues::CreateService do
  describe '#execute' do
    let(:project) { create(:project) }
    let(:board)   { create(:board, project: project) }
    let(:user)    { create(:user) }
    let(:label)   { create(:label, project: project, name: 'in-progress') }
    let!(:list)   { create(:list, board: board, label: label, position: 0) }

    subject(:service) { described_class.new(board.parent, project, user, board_id: board.id, list_id: list.id, title: 'New issue') }

    before do
      project.add_developer(user)
    end

    it 'delegates the create proceedings to Issues::CreateService' 


    it 'creates a new issue' 


    it 'adds the label of the list to the issue' 

  end
end

