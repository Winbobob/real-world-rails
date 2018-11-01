# frozen_string_literal: true

require 'rails_helper'

describe 'API::MemberServices' do
  describe 'PUT /api/member_services/members/' do
    let(:headers) do
      {
        'X-CHAMPAIGN-SIGNATURE' => '2d39dea4bc00ceff1ec1fdf160540400f673e97474b1d197d240b084bd186d34',
        'X-CHAMPAIGN-NONCE' => 'd7b82ede-17f2-4e79-8377-0ad1a1dd8621'
      }
    end

    let!(:member) do
      create(:member,
             email: 'test@sumofus.org',
             country: 'Belgium',
             first_name: 'Lydia',
             last_name: 'Testy',
             postal: '123456')
    end

    context 'given valid params' do
      let(:params) do
        {
          email: 'test@sumofus.org',
          member: {
            email: 'changed@sumofus.org',
            first_name: 'Max',
            last_name: 'Testy-Smith',
            country: 'United Kingdom',
            postal: 'EC2 1AB'
          }
        }
      end

      it 'updates the member details' 


      it "returns the member's json object" 

    end

    context 'given a member with the passed email address does not exist' do
      let(:params) do
        {
          email: 'new_member@sumofus.org',
          member: {
            first_name: 'Max'
          }
        }
      end

      it 'returns a 404 response' 

    end

    context 'given invalid params' do
      before do
        create(:member, email: 'john@sou.com')
        create(:member, email: 'taken@sou.com')
      end

      let(:params) do
        {
          email: 'john@sou.com',
          member: {
            email: 'taken@sou.com'
          }
        }
      end

      it 'sends back errors and status 422' 

    end
  end
end

