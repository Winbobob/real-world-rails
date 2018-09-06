# frozen_string_literal: true
require 'rails_helper'

describe 'Email Confirmation when signing up to express donations' do
  let!(:member) { create(:member, email: 'test@example.com', actionkit_user_id: 'actionkit_wohoo') }
  let!(:auth) { create(:member_authentication, token: '1234', member: member) }

  subject { get "/email_confirmation?#{params.to_query}" }

  context 'success' do
    let(:params) do
      {
        token: auth.token,
        email: 'test@example.com',
        language: 'EN'
      }
    end

    it 'confirms user authentication' 


    it 'sets html#lang to locale' 

  end

  describe 'locale' do
    let(:params) do
      { token: auth.token,
        email: 'test@example.com',
        language: 'de'
      }
    end

    it 'sets locale to passed language code' 

  end

  context 'failure' do
    params = { token: 'nosuchtoken',
               email: 'test@example.com',
               language: 'EN' }

    it 'renders error' 

  end

  context 'with missing memeber' do
    it 'renders error' 

  end
end

