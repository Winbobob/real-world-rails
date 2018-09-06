require 'rails_helper'

describe MembershipsController do
  let(:group) { FactoryBot.create(:formal_group) }
  let(:user) { FactoryBot.create(:user) }
  let(:another_group) { FactoryBot.create(:formal_group) }
  let(:another_user) { FactoryBot.create(:user) }

  describe "join" do
    it "store pending_group_token in session" 

  end

  describe "GET 'show'" do
    let(:membership) { create(:membership, token: 'abc', group: group, user: user) }

    context 'membership not found' do
      it 'renders error page with not found message' 

    end

    context 'membership used' do
      before do
        sign_in user
        membership.update_attribute(:accepted_at, Time.now)
      end

      it 'says sorry invitatino already used' 

    end

    context 'with an associated identity' do
      before { group.group_identities.create(identity: create(:slack_identity)) }

      it 'redirects to the group if a member' 

    end

    context "user not signed in" do
      before do
        get :show, params: { token: membership.token }
      end

      it "sets session attribute of the membership token" 


      it "redirects to the group" 


      it 'does not accept the membership' 


    end

    it 'redirects to a group url if that token is given' 


    it "accepts membership and redirects to group " 

  end
end

