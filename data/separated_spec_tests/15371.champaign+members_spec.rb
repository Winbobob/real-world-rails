# frozen_string_literal: true

require 'rails_helper'

describe 'API::Stateless Members' do
  include Requests::RequestHelpers
  include AuthToken

  describe 'GET show' do
    let(:member) do
      create(:member, first_name: 'Harriet',
                      last_name: 'Tubman',
                      email: 'test@example.com',
                      actionkit_user_id: '8244194')
    end

    let(:other_member) { create(:member, first_name: 'Other', last_name: 'User', email: 'other_member@example.com') }

    before :each do
      member.create_authentication(password: 'password')
    end

    def auth_headers
      token = encode_jwt(member.token_payload)
      { authorization: "Bearer #{token}" }
    end

    it 'returns member information for the member' 

  end

  describe 'PUT update' do
    let(:member) do
      create(:member, first_name: 'Harriet',
                      last_name: 'Tubman',
                      email: 'test@example.com',
                      actionkit_user_id: '8244194')
    end

    let(:other_member) { create(:member, first_name: 'Other', last_name: 'User', email: 'other_member@example.com') }

    before :each do
      member.create_authentication(password: 'password')
    end

    def auth_headers
      token = encode_jwt(member.token_payload)
      { authorization: "Bearer #{token}" }
    end

    context 'with valid parameters' do
      let(:params) do
        {
          member: {
            first_name: 'Harry',
            last_name: 'Tubman',
            email: 'test+1@example.com',
            country: 'United Kingdom',
            city: 'London',
            postal: '12345',
            address1: 'Jam Factory 123'
          }
        }
      end

      subject do
        put "/api/stateless/members/#{member.id}", params: params, headers: auth_headers
      end

      it 'updates the member locally and sends it back as json' 


      it 'sends the message to the AK processor' 

    end

    context 'with invalid parameters' do
      let(:bad_params) do
        {
          member: {
            first_name: 'Harry',
            last_name: 'Tubman',
            email: other_member.email,
            country: 'United Kingdom',
            city: 'London',
            postal: '123456',
            address1: 'a place'
          }
        }
      end

      it 'sends back error messages if the parameters are invalid' 

    end
  end

  describe 'POST create' do
    let(:member_params) do
      {
        name: 'Bob',
        postal: 'W1',
        email: 'test@example.com',
        country: 'GB',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    context 'valid request' do
      let(:member) { Member.first }

      it 'creates a member with authentication' 

    end

    context 'invalid request' do
      it 'creates a member with authentication' 

    end
  end
end

