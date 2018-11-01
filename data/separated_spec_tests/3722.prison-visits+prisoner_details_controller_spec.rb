require 'rails_helper'

RSpec.describe PrisonerDetailsController, type: :controller do
  render_views

  let(:prisoner_hash) do
    {
      prisoner: {
        first_name: 'Jimmy',
        last_name: 'Harris',
        date_of_birth: {
          day: '20',
          month: '04',
          year: '1986'
        },
        number: 'g3133ff',
        prison_name: 'Rochester'
      }
    }
  end

  it_behaves_like "a browser without a session present"
  it_behaves_like "a session timed out"

  context "always" do
    it "creates a new session" 

  end

  context "when cookies are disabled" do
    it "redirects the user to a page telling them that they won't be able to use the site" 

  end

  context "cookies are enabled" do
    before :each do
      cookies['cookies-enabled'] = 1
      allow(request).to receive(:ssl?).and_return(true)
    end

    it "renders the form for entering prisoner details, and assigns the session" 


    it "sets the 'cookies-enabled' cookie" 


    context "given valid prisoner details" do
      before :each do
        get :edit
      end

      it "updates prisoner details and redirects to the email flow" 


      it "updates prisoner details with bad date and redirects back" 


      it "doesn't accept the year as having two digits" 


      context "whitespace trimming" do
        it "removes whitespace from strings" 

      end
    end
  end
end

