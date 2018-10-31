require 'rails_helper'

RSpec.describe Admin::GroupsController do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }
  let(:group) { Fabricate(:group) }

  before do
    sign_in(admin)
  end

  describe '#create' do
    it 'should work' 

  end

  describe '#add_owners' do
    it 'should work' 

  end

  describe '#remove_owner' do
    it 'should work' 

  end

  describe "#bulk_perform" do
    let(:group) do
      Fabricate(:group,
        name: "test",
        primary_group: true,
        title: 'WAT',
        grant_trust_level: 3
      )
    end

    let(:user) { Fabricate(:user, trust_level: 2) }
    let(:user2) { Fabricate(:user, trust_level: 4) }

    it "can assign users to a group by email or username" 

  end

  context "#destroy" do
    it 'should return the right response for an invalid group_id' 


    describe 'when group is automatic' do
      it "returns the right response" 

    end

    describe 'for a non automatic group' do
      it "returns the right response" 

    end
  end
end

