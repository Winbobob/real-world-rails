# frozen_string_literal: true

require 'rails_helper'

describe MemberWithAuthentication do
  let(:valid_params) do
    {
      name: 'Foo',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password',
      country: 'DE'
    }
  end

  context 'valid params' do
    it 'creates a member' 


    it 'creates valid authentication' 


    context 'existing member' do
      it 'creates authentication' 

    end
  end

  context 'with errors' do
    it 'on blank email' 


    it 'on non-matching passwords' 


    it 'on too short a password' 


    it 'on existing authentication' 

  end
end

