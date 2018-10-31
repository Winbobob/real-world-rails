require 'rails_helper'

describe API::RegistrationsController do
  let(:registration_params) {{
    name: "Jon Snow",
    email: "jon@snow.com",
    recaptcha: "notarobot"
  }}

  before { request.env["devise.mapping"] = Devise.mappings[:user] }

  describe 'create' do
    let(:pending_membership) { create :membership, user: User.new(email: registration_params[:email]) }

    it 'creates a new user' 


    it 'sends a login email' 


    it 'logs in immediately if pending invitation is present' 


    it 'does not create a new user if recaptcha is not present' 


    it 'does not create a new user if the recaptcha is invalid' 

  end

  describe 'oauth' do
    let(:pending_membership) { create :membership, accepted_at: 1.day.ago }
    let(:identity) { create :slack_identity, name: "Bill Bobbington", email: "bill@bobbington.ninja" }
    it 'removes a pending membership if its already been used' 

  end
end

