require 'rails_helper'

RSpec.describe "login timeout", type: :request, csrf: false do
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

  let!(:user) { FactoryBot.create(:sysadmin_user, user_attributes) }

  before do
    host! "moderate.petition.parliament.uk"
    https!
  end

  it "logs out automatically after a certain time period" 

end

