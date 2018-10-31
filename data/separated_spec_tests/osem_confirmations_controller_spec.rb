# frozen_string_literal: true

require 'spec_helper'

describe ConfirmationsController do
  let(:user) { create(:user, confirmed_at: nil) }

  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  context 'user is not signed in' do
    it 'confirms and signs in user' 

  end

  context 'user is signed in' do
    before { sign_in user }

    it 'confirms user' 

  end
end

