require 'rails_helper'

describe API::GroupIdentitiesController do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:identity) { create :slack_identity, user: user }
  let(:group) { create :formal_group }
  let(:group_identity) { create :group_identity, identity: identity, group: group }

  before { group.add_admin! user }

  # TODO :(
  describe 'create' do
    it 'updates the group identity if it exists' 


    it 'uses the actor identity if group does not have one' 


    it 'does not allow unauthorized uses to create group identities' 

  end

  describe 'destroy' do
    before { group_identity }

    it 'destroys an existing group identity' 


    it 'allows other admins to destroy group identities' 


    it 'does not allow unauthorized users to destroy identities' 

  end
end

