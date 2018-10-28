require "rails_helper"

RSpec.describe "Organization setting page(/settings/organization)", type: :feature, js: true do
  let(:user) { create(:user) }
  let(:organization) { create(:organization) }

  before do
    sign_in user
  end

  # rubocop:disable RSpec/ExampleLength
  it "user creates an organization" 


  it "remove user from organization" 

  # rubocop:enable RSpec/ExampleLength
end

