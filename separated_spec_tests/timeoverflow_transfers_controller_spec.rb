require 'spec_helper'

describe TransfersController do
  let (:test_organization) { Fabricate(:organization) }
  let (:member_admin) { Fabricate(:member, organization: test_organization, manager: true) }
  let (:member_giver) { Fabricate(:member, organization: test_organization) }
  let (:member_taker) { Fabricate(:member, organization: test_organization) }

  include_context 'stub browser locale'

  before { set_browser_locale('ca') }

  describe '#new' do
    let(:user) { member_giver.user }

    before { login(user) }

    context 'when the destination is a user account' do
      let(:user_account) do
        user.members.find_by(organization: user.organizations.first).account
      end
      let(:params) do
        {
          id: user.id,
          destination_account_id: user_account.id
        }
      end

      it 'finds the accountable' 


      it 'finds the destination account' 


      it 'builds a transfer with the id of the destination' 


      context 'when the offer is specified' do
        let(:offer) { Fabricate(:offer, organization: user.organizations.first) }

        it 'finds the transfer offer' 


        it 'builds a transfer with the offer as post' 

      end

      context 'when the offer is not specified' do
        it 'does not find any offer' 

      end

      context 'when the user is admin of the current organization' do
        let(:user) { member_admin.user }

        it 'finds all accounts in the organization as sources' 

      end

      context 'when the user is not admin of the current organization' do
        it 'does not assign :sources' 

      end
    end

    context 'when the destination is an organization account' do
      let(:params) do
        {
          id: test_organization.id,
          destination_account_id: test_organization.account.id
        }
      end

      it 'finds the accountable' 


      it 'finds the destination account' 


      it 'builds a transfer with the id of the destination' 


      context 'when the user is the admin of the current organization' do
        let(:user) { member_admin.user }

        it 'renders the page successfully' 


        it 'finds the transfer source' 

      end

      context 'when an offer is specified' do
        let(:offer) { Fabricate(:offer, organization: test_organization) }

        it 'finds the transfer offer' 

      end
    end
  end

  describe 'POST #create' do
    before { login(user) }

    context 'with valid params' do
      context 'with an admin user logged' do
        subject(:post_create) do
          post 'create', transfer: {
            source: member_giver.account.id,
            destination: member_taker.account.id,
            amount: 5
          }
        end

        let(:user) { member_admin.user }

        it 'creates a new Transfer' 


        it 'creates two Movements' 


        it 'updates the balance of both accounts' 

      end

      context 'with a regular user logged' do
        subject(:post_create) do
          post 'create', transfer: {
            destination: member_taker.account.id,
            amount: 5
          }
        end

        let(:user) { member_giver.user }

        it 'creates a new Transfer' 


        it 'creates two Movements' 


        it 'updates the balance of both accounts' 


        it 'redirects to destination' 

      end
    end
  end
end

