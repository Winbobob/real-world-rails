require 'spec_helper'

describe Profiles::EmailsController do
  let(:user) { create(:user) }

  before do
    sign_in(user)
  end

  describe '#create' do
    let(:email_params) { { email: "add_email@example.com" } }

    it 'sends an email confirmation' 

  end

  describe '#resend_confirmation_instructions' do
    let(:email_params) { { email: "add_email@example.com" } }

    it 'resends an email confirmation' 


    it 'unable to resend an email confirmation' 

  end
end

