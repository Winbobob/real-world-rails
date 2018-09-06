require 'rails_helper'

describe GroupIdentityService do
  let(:group) { create :formal_group }
  let(:group_identity) { build :group_identity, group: group, identity: identity, slack_channel_name: "channel", slack_channel_id: "123" }
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:identity) { create :slack_identity, user: user }
  before { group.add_admin! user }

  describe 'create' do
    it 'creates a new group identity' 


    it 'uses an existing identity if it exists' 


    it 'does not allow unauthorized users to create a group identity' 


    it 'does not let a user add another users identity' 

  end
end

