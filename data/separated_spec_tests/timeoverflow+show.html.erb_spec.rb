require 'spec_helper'

RSpec.describe 'offers/show' do
  let(:organization) { Fabricate(:organization) }
  let(:member) { Fabricate(:member, organization: organization) }
  let(:offer) { Fabricate(:offer, user: member.user, organization: organization) }
  let(:destination_account) { Fabricate(:account) }

  before do
    allow(view).to receive(:admin?).and_return(false)
    allow(offer).to receive(:member).and_return(member)
  end

  context 'when the user is logged in' do
    let(:logged_user) { Fabricate(:user) }

    before do
      Fabricate(
        :member,
        organization: organization,
        user: logged_user
      )

      allow(view).to receive(:current_user).and_return(logged_user)
    end

    context 'when the current organization is the same as offer\'s organization' do
      before do
        allow(view).to receive(:current_organization) { offer.organization }
      end

      it 'renders a link to the transfer page' 


      it 'displays offer\'s user details' 

    end

    context 'when the current organization is not the same as offer\'s organization' do
      let(:another_organization) { Fabricate(:organization) }

      before do
        Fabricate(
          :member,
          organization: another_organization,
          user: logged_user
        )

        allow(view).to receive(:current_organization) { another_organization }
      end

      it 'doesn\'t render a link to the transfer page' 


      it 'doesn\'t display offer\'s user details' 


      it 'displays the offer\'s organization' 

    end
  end

  context 'when the user is not logged in' do
    before do
      allow(view).to receive(:current_user).and_return(nil)
      allow(view).to receive(:current_organization).and_return(nil)
    end

    it 'does not render a link to the transfer page' 


    it 'renders a link to the login page' 


    it 'displays the offer\'s organization' 


    it 'doesn\'t display offer\'s user details' 

  end
end

