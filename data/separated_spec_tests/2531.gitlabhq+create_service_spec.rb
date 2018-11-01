# frozen_string_literal: true

require 'spec_helper'

describe Boards::Visits::CreateService do
  describe '#execute' do
    let(:user) { create(:user) }

    context 'when a project board' do
      let(:project)       { create(:project) }
      let(:project_board) { create(:board, project: project) }

      subject(:service) { described_class.new(project_board.parent, user) }

      it 'returns nil when there is no user' 


      it 'returns nil when database is read only' 


      it 'records the visit' 

    end

    context 'when a group board' do
      let(:group)       { create(:group) }
      let(:group_board) { create(:board, group: group) }

      subject(:service) { described_class.new(group_board.parent, user) }

      it 'returns nil when there is no user' 


      it 'records the visit' 

    end
  end
end

