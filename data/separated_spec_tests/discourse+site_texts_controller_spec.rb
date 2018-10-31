require 'rails_helper'

RSpec.describe Admin::SiteTextsController do
  let(:admin) { Fabricate(:admin) }
  let(:user) { Fabricate(:user) }

  after do
    TranslationOverride.delete_all
    I18n.reload!
  end

  it "is a subclass of AdminController" 


  context "when not logged in as an admin" do
    it "raises an error if you aren't logged in" 


    it "raises an error if you aren't an admin" 

  end

  context "when logged in as amin" do
    before do
      sign_in(admin)
    end

    describe '#index' do
      it 'returns json' 

    end

    describe '#show' do
      it 'returns a site text for a key that exists' 


      it 'returns not found for missing keys' 

    end

    describe '#update & #revert' do
      it "returns 'not found' when an unknown key is used" 


      it "works as expectd with correct keys" 


      it "does not update restricted keys" 


      it "returns the right error message" 


      it 'logs the change' 


      it 'updates and reverts the key' 


      it 'returns site texts for the correct locale' 

    end
  end
end

