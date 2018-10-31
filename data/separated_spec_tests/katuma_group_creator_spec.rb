require 'rails_helper'

module BasicResources
  describe GroupCreator do
    let(:creator) do
      user = FactoryGirl.create(:user)
      User.find(user.id)
    end
    let(:group) { FactoryGirl.build(:group) }
    let(:gc) { described_class.new(group, creator) }

    describe 'initialize group and creator instance variables' do
      it 'initialize group instance variable' 


      it 'initialize creator instance variable' 

    end

    describe '#create' do
      it 'creates a new group' 


      it 'adds creator as a group admin' 

    end
  end
end

