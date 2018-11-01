# frozen_string_literal: true

require 'rails_helper'

describe MemberAuthenticationsController do
  describe 'POST create' do
    let(:auth) { double('auth', valid?: true, member_id: 34) }
    let(:page) { double('page', slug: 'heyo', page_id: '1', language: double('language', code: :en)) }

    before do
      allow(MemberAuthenticationBuilder).to receive(:build) { auth }
      allow(Page).to receive(:first) { page }
      allow(I18n).to receive(:locale=)

      session[:follow_up_url] = '/a/b'
      post :create, params: { email: 'test@example.com', password: 'p', password_confirmation: 'p' }
    end

    it 'builds authentication' 


    it 'sets locale' 


    context 'successfully creates authentication' do
      it 'returns with js snippet to redirect that includes member id' 


      it 'sets flash notice' 

    end

    context 'unsuccessfully creates authentication' do
      let(:auth) { double('auth', valid?: false, errors: [{ foo: :bar }]) }

      it 'returns errors as json' 

    end
  end
end

