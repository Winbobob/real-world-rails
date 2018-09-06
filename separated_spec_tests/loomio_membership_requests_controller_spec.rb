require 'rails_helper'
describe API::MembershipRequestsController do

  let(:user) { create :user }
  let(:group) { create :formal_group, members_can_add_members: true }
  let(:other_group) { create :formal_group }
  let(:pending_membership_request) { create :membership_request, group: group }
  let(:other_pending_membership_request) { create :membership_request, group: other_group }
  let(:approved_membership_request) { create :membership_request, group: group }

  before do
    group.add_member! user
    pending_membership_request
    approved_membership_request.approve!(user)
    sign_in user
  end

  describe 'pending' do
    context 'permitted' do
      it 'returns users filtered by group' 

    end

    context 'not permitted' do
      it 'returns AccessDenied' 

    end
  end

  describe 'previous' do
    context 'permitted' do
      it 'returns users filtered by group' 

    end

    context 'not permitted' do
      it 'returns AccessDenied' 

    end
  end

  describe 'approve' do
    context 'permitted' do
      it 'approves membership request' 

    end

    context 'not permitted' do
      it 'raises AccessDenied exception' 

    end
  end

  describe 'ignore' do
    context 'permitted' do
      it 'ignores membership request' 

    end

    context 'not permitted' do
      it 'raises AccessDenied exception' 

    end
  end
end

