require 'spec_helper'

describe BoardsHelper do
  describe '#build_issue_link_base' do
    context 'project board' do
      it 'returns correct path for project board' 

    end

    context 'group board' do
      let(:base_group) { create(:group, path: 'base') }

      it 'returns correct path for base group' 


      it 'returns correct path for subgroup' 

    end
  end

  describe '#board_data' do
    let(:user) { create(:user) }
    let(:project) { create(:project) }
    let(:board) { create(:board, project: project) }

    before do
      assign(:board, board)
      assign(:project, project)

      allow(helper).to receive(:current_user) { user }
      allow(helper).to receive(:can?).with(user, :admin_list, project).and_return(true)
    end

    it 'returns a board_lists_path as lists_endpoint' 

  end
end

