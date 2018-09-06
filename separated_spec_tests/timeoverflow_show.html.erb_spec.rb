require 'spec_helper'

describe 'offers/show' do
  let(:organization) { Fabricate(:organization) }
  let(:member) { Fabricate(:member, organization: organization) }
  let(:offer) { Fabricate(:offer, user: member.user, organization: organization) }
  let(:destination_account) { Fabricate(:account) }

  before do
    allow(view).to receive(:admin?).and_return(false)
    allow(view).to receive(:current_organization) { organization }

    allow(offer).to receive(:member).and_return(member)
  end

  context 'when there is logged in' do
    let(:logged_user) { Fabricate(:user) }

    before do
      Fabricate(
        :member,
        organization: organization,
        user: logged_user
      )

      allow(view).to receive(:current_user).and_return(logged_user)
    end

    it 'renders a link to the transfer page' 

  end

  context 'where is a guest user' do
    before do
      allow(view).to receive(:current_user).and_return(nil)
    end

    it 'does not render a link to the transfer page' 


    it 'renders a link to the login page' 

  end
end

