require "rails_helper"

RSpec.describe "all routes", type: :routing do
  let(:podcast)     { create(:podcast) }
  let(:user)        { create(:user) }

  it "renders a podcast index if there is a podcast with the slug successfully" 


  it "renders a user index if there is a user with the username successfully" 


  # rubocop:disable RSpec/ExampleLength
  it "renders a user's story successfully" 

  # rubocop:enable RSpec/ExampleLength

  context "when redirected routes" do
    include RSpec::Rails::RequestExampleGroup

    it "redirects /shop to shop.dev.to" 

  end
end

