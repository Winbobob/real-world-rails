require File.dirname(__FILE__) + '/../../spec_helper'

# TODO - this is NOT an exemplar. Don't use it as such. :\
describe ContentPartners::ContentPartnerContactsController do

  # This is a little weird, but we have some cases where an access_denied is
  # expected to call redirect_back_or_default and if it doesn't, it will bail
  # out on another problem. This allows us to control how that works:
  class Redirection < StandardError ; end

  before(:all) do
    Language.create_english
    ContentPartnerStatus.create_enumerated
  end

  let(:content_partner) do
    ContentPartner.gen(full_name: 'Test content partner')
  end

  before do
    allow(controller).to receive(:check_authentication) { false }
    @user = build_stubbed(User)
    allow(@user).to receive(:can_create?) { true }
    allow(controller).to receive(:current_user) { @user }
  end

  describe 'GET new' do

    it 'checks authentication' 


    it 'assigns partner' 


    it 'assigns contract' 


    it 'denies access if user cannot create contact' 


    it 'assigns new page_subheader' 


  end

  describe 'POST create' do

    it 'checks authentication' 


    it 'assigns partner' 


    it 'assigns contract' 


    it 'denies access if user cannot create contact' 


    context 'with a proper contact' do

      subject do
        post :create,
          content_partner_contact:
            build(ContentPartnerContact,
                  content_partner: content_partner).attributes,
          content_partner_id: content_partner.id
      end

      it 'tells you it worked' 


      it 'redirects to content partner' 


    end

    context 'with an INVALID contact' do

      subject do
        post :create,
          content_partner_contact: {},
          content_partner_id: content_partner.id
      end

      it 'tells you it failed' 


      it 'renders :new' 


      it 'assigns new page_subheader' 


    end

  end

  it 'will test all the edit stuff'

  it 'will test all the update stuff'

  it 'will test all the delete stuff'

end

