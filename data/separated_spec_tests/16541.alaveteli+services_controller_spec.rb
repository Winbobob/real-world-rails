require 'spec_helper'
require 'fakeweb'

describe ServicesController do

  render_views

  describe '#other_country_message' do

    # store and restore the locale in the context of the test suite to isolate
    # changes made in these tests
    before do
      @old_locale = FastGettext.locale
    end

    after do
      FastGettext.set_locale(@old_locale)
    end

    it 'keeps the flash' 


    it "shows no alaveteli message when user in same country as deployed alaveteli" 


    it "shows a message if user location has a deployed FOI website" 


    context 'when user not in the same country as site' do

      it "shows a message when user country has no FOI website" 


      it "shows a message when user country has no FOI website and WorldFOIWebsites has no data about the deployed alaveteli" 


      it "shows an EU message if the user location has a deployed FOI website and is covered by AskTheEU" 


      it "shows a message when user country has no FOI website but user country is covered by EU" 


      it "shows a message when and user country has no FOI website and WorldFOIWebsites has no data about the deployed alaveteli but user is covered by EU" 


    end

  end

  describe '#hidden_user_explanation' do

    let(:user) { FactoryBot.create(:user, name: "P O'Toole") }
    let(:info_request) { FactoryBot.create(:info_request, user: user) }

    it 'generates plaintext output' 


    it 'does not HTML escape the user or site name' 


  end

end

