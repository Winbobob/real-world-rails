require 'rails_helper'

describe API::RegistrationsController do
  let(:registration_params) {{
    name: "Jon Snow",
    email: "jon@snow.com",
    legal_accepted: true
  }}

  before { request.env["devise.mapping"] = Devise.mappings[:user] }

  describe 'create' do
    let(:pending_membership) { create :membership, user: User.new(email: registration_params[:email]) }
    let(:pending_identity)   { create :facebook_identity, email: registration_params[:email] }

    it 'creates a new user' 


    it 'requires acceptance of legal' 


    it 'sends a login email' 


    it 'logs in immediately if pending invitation is present' 


    it 'logs in immediately if pending identity is present' 


    describe 'RECAPTCHA env present' do
      before { ENV['RECAPTCHA_APP_KEY'] = 'huzzah' }
      after  { ENV.delete('RECAPTCHA_APP_KEY') }

      it 'validates the recaptcha value' 


      it 'invalidtes user on recaptcha failure' 

    end
  end
end

