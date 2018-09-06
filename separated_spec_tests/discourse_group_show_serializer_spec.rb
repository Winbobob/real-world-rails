require 'rails_helper'

describe GroupShowSerializer do
  let(:user) { Fabricate(:user) }
  let(:group) { Fabricate(:group) }

  context 'admin user' do
    let(:user) { Fabricate(:admin) }
    let(:group) { Fabricate(:group, users: [user]) }

    it 'should return the right attributes' 

  end

  context 'group owner' do
    before do
      group.add_owner(user)
    end

    it 'should return the right attributes' 

  end

  describe '#mentionable' do
    let(:group) { Fabricate(:group, mentionable_level: Group::ALIAS_LEVELS[:everyone]) }

    it 'should return the right value' 

  end
end

