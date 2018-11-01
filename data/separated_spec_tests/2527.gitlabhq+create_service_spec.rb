require 'spec_helper'

describe Boards::Lists::CreateService do
  describe '#execute' do
    shared_examples 'creating board lists' do
      let(:user)    { create(:user) }

      subject(:service) { described_class.new(parent, user, label_id: label.id) }

      before do
        parent.add_developer(user)
      end

      context 'when board lists is empty' do
        it 'creates a new list at beginning of the list' 

      end

      context 'when board lists has the done list' do
        it 'creates a new list at beginning of the list' 

      end

      context 'when board lists has labels lists' do
        it 'creates a new list at end of the lists' 

      end

      context 'when board lists has label and done lists' do
        it 'creates a new list at end of the label lists' 

      end

      context 'when provided label does not belongs to the parent' do
        it 'raises an error' 

      end
    end

    context 'when board parent is a project' do
      let(:parent) { create(:project) }
      let(:board) { create(:board, project: parent) }
      let(:label) { create(:label, project: parent, name: 'in-progress') }

      it_behaves_like 'creating board lists'
    end

    context 'when board parent is a group' do
      let(:parent) { create(:group) }
      let(:board) { create(:board, group: parent) }
      let(:label) { create(:group_label, group: parent, name: 'in-progress') }

      it_behaves_like 'creating board lists'
    end
  end
end

