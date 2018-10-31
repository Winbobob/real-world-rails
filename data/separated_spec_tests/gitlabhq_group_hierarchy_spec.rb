require 'spec_helper'

describe Gitlab::GroupHierarchy, :postgresql do
  let!(:parent) { create(:group) }
  let!(:child1) { create(:group, parent: parent) }
  let!(:child2) { create(:group, parent: child1) }

  describe '#base_and_ancestors' do
    let(:relation) do
      described_class.new(Group.where(id: child2.id)).base_and_ancestors
    end

    it 'includes the base rows' 


    it 'includes all of the ancestors' 


    it 'can find ancestors upto a certain level' 


    it 'uses ancestors_base #initialize argument' 


    it 'does not allow the use of #update_all' 

  end

  describe '#base_and_descendants' do
    let(:relation) do
      described_class.new(Group.where(id: parent.id)).base_and_descendants
    end

    it 'includes the base rows' 


    it 'includes all the descendants' 


    it 'uses descendants_base #initialize argument' 


    it 'does not allow the use of #update_all' 

  end

  describe '#descendants' do
    it 'includes only the descendants' 

  end

  describe '#ancestors' do
    it 'includes only the ancestors' 


    it 'can find ancestors upto a certain level' 

  end

  describe '#all_groups' do
    let(:relation) do
      described_class.new(Group.where(id: child1.id)).all_groups
    end

    it 'includes the base rows' 


    it 'includes the ancestors' 


    it 'includes the descendants' 


    it 'uses ancestors_base #initialize argument for ancestors' 


    it 'uses descendants_base #initialize argument for descendants' 


    it 'does not allow the use of #update_all' 

  end
end

