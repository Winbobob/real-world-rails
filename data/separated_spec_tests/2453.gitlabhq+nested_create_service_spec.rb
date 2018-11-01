require 'spec_helper'

describe Groups::NestedCreateService do
  let(:user) { create(:user) }

  subject(:service) { described_class.new(user, params) }

  shared_examples 'with a visibility level' do
    it 'creates the group with correct visibility level' 


    context 'adding a visibility level ' do
      it 'overwrites the visibility level' 

    end
  end

  describe 'without subgroups' do
    let(:params) { { group_path: 'a-group' } }

    before do
      allow(Group).to receive(:supports_nested_groups?) { false }
    end

    it 'creates the group' 


    it 'returns the group if it already existed' 


    it 'raises an error when tring to create a subgroup' 


    it_behaves_like 'with a visibility level'
  end

  describe 'with subgroups', :nested_groups do
    let(:params) { { group_path: 'a-group/a-sub-group' } }

    describe "#execute" do
      it 'returns the group if it already existed' 


      it 'reuses a parent if it already existed' 


      it 'creates group and subgroup in the database' 


      it_behaves_like 'with a visibility level'
    end
  end
end

