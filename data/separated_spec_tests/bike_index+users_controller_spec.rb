require 'spec_helper'

describe Organized::UsersController, type: :controller do
  context 'logged_in_as_organization_member' do
    include_context :logged_in_as_organization_member
    describe 'index' do
      it 'redirects' 

    end

    describe 'new' do
      it 'redirects' 

    end

    describe 'update' do
      context 'organization_invitation' do
        let(:organization_invitation) { FactoryGirl.create(:organization_invitation, organization: organization, inviter: user) }
        let(:organization_invitation_params) do
          {
            membership_role: 'admin',
            name: 'something',
            inviter_id: 333,
            invitee_email: 'new_bike_email@bike_shop.com'
          }
        end
        it 'does not update' 

      end
    end
  end
  context 'logged_in_as_organization_admin' do
    include_context :logged_in_as_organization_admin
    describe 'index' do
      it 'renders' 

    end

    describe 'new' do
      it 'renders the page' 

    end

    describe 'edit' do
      context 'membership' do
        let(:membership) { FactoryGirl.create(:existing_membership, organization: organization) }
        it 'renders the page' 

      end
      context 'organization_invitation' do
        let(:invitation) { FactoryGirl.create(:organization_invitation, organization: organization) }
        it 'renders the page' 

      end
    end

    describe 'update' do
      context 'organization_invitation' do
        let(:organization_invitation) { FactoryGirl.create(:organization_invitation, organization: organization, inviter: user) }
        let(:organization_invitation_params) do
          {
            membership_role: 'admin',
            name: 'something',
            inviter_id: 333,
            invitee_email: 'new_bike_email@bike_shop.com'
          }
        end
        it 'updates name and role, ignores email' 

      end
      context 'membership' do
        context 'other valid membership' do
          let(:membership) { FactoryGirl.create(:existing_membership, organization: organization, role: 'member') }
          let(:membership_params) { { role: 'admin', user_id: 333 } }
          it 'updates the role' 

        end
        context 'marking self member' do
          let(:membership) { user.memberships.first }
          it 'does not update the membership' 

        end
      end
    end

    describe 'destroy' do
      context 'organization_invitation' do
        let(:organization_invitation) { FactoryGirl.create(:organization_invitation, organization: organization, inviter: user) }
        it 'destroys' 

      end
      context 'membership' do
        context 'other valid membership' do
          let(:membership) { FactoryGirl.create(:existing_membership, organization: organization, role: 'member') }
          it 'destroys the membership' 

        end
        context 'marking self member' do
          let(:membership) { user.memberships.first }
          it 'does not destroy' 

        end
      end
    end

    describe 'create' do
      let(:organization_invitation_params) do
        {
          membership_role: 'member',
          invitee_name: 'cool',
          invitee_email: 'bike_email@bike_shop.com'
        }
      end
      context 'available invitations' do
        it 'creates organization_invitation, reduces invitation tokens by 1' 

      end
      context 'no available invitations' do
        it 'does not create a new organization_invitation' 

      end
    end
  end
end

