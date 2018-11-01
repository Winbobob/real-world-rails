require 'rails_helper'

describe BasicGroupUserSerializer do
  let(:group) { Fabricate(:group) }
  let(:user) { Fabricate(:user) }

  before do
    group.add(user)
  end

  describe '#owner' do
    describe 'when scoped to the user' do
      it 'should be false' 

    end

    describe 'when not scoped to the user' do
      it 'should be nil' 

    end
  end
end

