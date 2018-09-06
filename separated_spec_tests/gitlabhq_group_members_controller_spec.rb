require 'spec_helper'

describe Groups::GroupMembersController do
  let(:user)  { create(:user) }
  let(:group) { create(:group, :public, :access_requestable) }

  describe 'GET index' do
    it 'renders index with 200 status code' 

  end

  describe 'POST create' do
    let(:group_user) { create(:user) }

    before do
      sign_in(user)
    end

    context 'when user does not have enough rights' do
      before do
        group.add_developer(user)
      end

      it 'returns 403' 

    end

    context 'when user has enough rights' do
      before do
        group.add_owner(user)
      end

      it 'adds user to members' 


      it 'adds no user to members' 

    end
  end

  describe 'PUT update' do
    let(:requester) { create(:group_member, :access_request, group: group) }

    before do
      group.add_owner(user)
      sign_in(user)
    end

    Gitlab::Access.options.each do |label, value|
      it "can change the access level to #{label}" 

    end
  end

  describe 'DELETE destroy' do
    let(:member) { create(:group_member, :developer, group: group) }

    before do
      sign_in(user)
    end

    context 'when member is not found' do
      it 'returns 403' 

    end

    context 'when member is found' do
      context 'when user does not have enough rights' do
        before do
          group.add_developer(user)
        end

        it 'returns 403' 

      end

      context 'when user has enough rights' do
        before do
          group.add_owner(user)
        end

        it '[HTML] removes user from members' 


        it '[JS] removes user from members' 

      end
    end
  end

  describe 'DELETE leave' do
    before do
      sign_in(user)
    end

    context 'when member is not found' do
      it 'returns 404' 

    end

    context 'when member is found' do
      context 'and is not an owner' do
        before do
          group.add_developer(user)
        end

        it 'removes user from members' 


        it 'supports json request' 

      end

      context 'and is an owner' do
        before do
          group.add_owner(user)
        end

        it 'cannot removes himself from the group' 

      end

      context 'and is a requester' do
        before do
          group.request_access(user)
        end

        it 'removes user from members' 

      end
    end
  end

  describe 'POST request_access' do
    before do
      sign_in(user)
    end

    it 'creates a new GroupMember that is not a team member' 

  end

  describe 'POST approve_access_request' do
    let(:member) { create(:group_member, :access_request, group: group) }

    before do
      sign_in(user)
    end

    context 'when member is not found' do
      it 'returns 403' 

    end

    context 'when member is found' do
      context 'when user does not have enough rights' do
        before do
          group.add_developer(user)
        end

        it 'returns 403' 

      end

      context 'when user has enough rights' do
        before do
          group.add_owner(user)
        end

        it 'adds user to members' 

      end
    end
  end
end

