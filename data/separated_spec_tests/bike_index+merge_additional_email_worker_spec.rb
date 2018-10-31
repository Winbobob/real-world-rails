require 'spec_helper'

describe MergeAdditionalEmailWorker do
  it { is_expected.to be_processed_in :updates }

  context 'confirmed' do
    let(:email) { 'FOO@barexample.com' }
    let(:ownership) { FactoryGirl.create(:ownership, owner_email: email) }
    let(:user_email) { FactoryGirl.create(:user_email, email: email) }
    let(:user) { user_email.user }
    let(:organization_invitation) { FactoryGirl.create(:organization_invitation, invitee_email: "#{email.upcase} ") }

    context 'existing user account' do
      let(:bike) { FactoryGirl.create(:bike, creator_id: old_user.id) }
      let(:old_user) { FactoryGirl.create(:confirmed_user, email: email) }
      let(:pre_created_ownership) { FactoryGirl.create(:ownership, creator_id: old_user.id) }
      let(:old_user_ownership) { FactoryGirl.create(:ownership, owner_email: email) }

      let(:organization) { organization_invitation.organization }
      let(:second_organization) { FactoryGirl.create(:organization, auto_user_id: old_user.id) }
      let(:membership) { FactoryGirl.create(:membership, user: old_user, organization: second_organization) }
      let(:third_organization) { FactoryGirl.create(:organization, auto_user_id: old_user.id) }
      let(:old_membership) { FactoryGirl.create(:membership, user: old_user, organization: third_organization) }
      let(:new_membership) { FactoryGirl.create(:membership, user: user, organization: third_organization) }

      let(:integration) { FactoryGirl.create(:integration, user: old_user, information: { 'info' => { 'email' => email, name: 'blargh' } }) }
      let(:lock) { FactoryGirl.create(:lock, user: old_user) }
      let(:payment) { FactoryGirl.create(:payment, user: old_user) }
      let(:customer_contact) { FactoryGirl.create(:customer_contact, user: old_user, creator: old_user) }
      let(:stolen_notification) { FactoryGirl.create(:stolen_notification, sender: old_user, receiver: old_user) }
      let(:oauth_application) { Doorkeeper::Application.create(name: 'MyApp', redirect_uri: 'https://app.com') }
      before do
        old_user.reload
        expect(ownership).to be_present
        expect(organization_invitation).to be_present
        expect(user_email.confirmed).to be_truthy
        old_user_ownership.mark_claimed
        expect(old_user.ownerships.first).to eq old_user_ownership
        expect(membership.user).to eq old_user
        expect(old_membership.user).to eq old_user
        expect(new_membership.user).to eq user
        expect(old_user.organizations.include?(second_organization)).to be_truthy
        expect(old_user.organizations.include?(organization)).to be_truthy
        oauth_application.update_attribute :owner_id, old_user.id
        expect(pre_created_ownership).to be_present
        expect(bike).to be_present
        expect(integration).to be_present
        expect(lock).to be_present
        expect(payment).to be_present
        expect(customer_contact).to be_present
        expect(stolen_notification).to be_present
      end

      it 'merges bikes and memberships and deletes user' 

    end

    context 'existing multi-user-account' do
      it 'merges all the accounts. It does not create multiple memberships for one org'
      # It would be nice to test this... future todo
    end

    context 'no existing user account' do
      before do
        expect(ownership).to be_present
        expect(organization_invitation).to be_present
        expect(user_email.confirmed).to be_truthy
      end

      it 'runs the same things as user_create' 

    end
  end

  context 'unconfirmed' do
    it "doesn't merge" 

  end
end

