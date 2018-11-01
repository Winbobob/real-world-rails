require "rails_helper"

RSpec.describe "StoriesShow", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:article) { FactoryBot.create(:article, user_id: user.id) }

  describe "GET /:username/:slug" do
    it "renders to appropriate page" 


    it "renders to appropriate if article belongs to org" 


    it "redirects to appropriate if article belongs to org and user visits user version" 


    it "renders to appropriate page if user changes username" 


    it "renders to appropriate page if user changes username twice" 


    it "renders to appropriate page if user changes username twice and go to middle username" 


    it "renders second and third users if present" 


    # rubocop:disable RSpec/ExampleLength
    it "renders articles of long length without breaking" 

    # rubocop:enable RSpec/ExampleLength
  end

  it "renders html variant" 


  it "Does not render variant when no variants published" 


  it "does not render html variant when user logged in" 

end

