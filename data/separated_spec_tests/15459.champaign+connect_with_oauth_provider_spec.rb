# frozen_string_literal: true
require 'rails_helper'

describe ConnectWithOauthProvider do
  let(:resp) { double(:resp, provider: 'google', uid: '1234', info: double(:info, email: 'foo@example.com')) }

  context "user doesn't exist" do
    it 'creates user' 

  end

  context 'user exists, but is disconnected' do
    # TODO: Replace with factory
    let!(:user) { User.create!(email: 'foo@example.com', password: 'password', password_confirmation: 'password') }

    it 'updates user' 

  end

  describe 'whitelisting' do
    it 'whitelists domain' 


    context 'empty whitelist' do
      it 'skips check' 

    end
  end
end

