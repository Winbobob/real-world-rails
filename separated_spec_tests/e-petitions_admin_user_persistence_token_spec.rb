require 'rails_helper'

RSpec.describe "admin user persistence token", type: :request, csrf: false do
  let(:user_attributes) do
    {
      first_name: "System",
      last_name: "Administrator",
      email: "admin@petition.parliament.uk",
      password: "L3tme1n!",
      password_confirmation: "L3tme1n!"
    }
  end

  let(:login_params) do
    { email: "admin@petition.parliament.uk", password: "L3tme1n!" }
  end

  before do
    FactoryBot.create(:sysadmin_user, user_attributes)
  end

  def new_browser
    open_session do |s|
      s.reset!
      s.host! "moderate.petition.parliament.uk"
      s.https!
    end
  end

  context "when a new session is created" do
    it "logs out existing sessions" 

  end

  context "when a session is destroyed" do
    it "resets the persistence token" 

  end

  context "when a session is stale" do
    before do
      host! "moderate.petition.parliament.uk"
      https!
    end

    it "resets the persistence token" 

  end
end

