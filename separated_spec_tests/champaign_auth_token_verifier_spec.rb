# frozen_string_literal: true
require 'rails_helper'

describe AuthTokenVerifier do
  describe '#verify' do
    let!(:member) { create(:member, email: 'foo@example.com', actionkit_user_id: 'actionkit_wohoo') }

    context 'with matching unconfirmed record' do
      let!(:member_authentication) { create(:member_authentication, token: 'a_token', member: member) }

      subject { AuthTokenVerifier.new('a_token', member) }

      it 'is successful' 


      it 'confirms member authentication' 

    end

    context 'with matching confirmed record' do
      let!(:member_authentication) do
        create(:member_authentication,
               confirmed_at: Time.now,
               token: 'a_token',
               member: member)
      end

      subject { AuthTokenVerifier.new('a_token', member) }

      it 'is unsuccessful' 


      it 'does not recomfirm member authentication' 


      it 'returns error' 


      it 'does not push to the ActionKit queue' 

    end

    context 'with no matching record' do
      subject { AuthTokenVerifier.new('nosuchtoken', member) }

      it 'is unsuccessful' 


      it 'returns error' 

    end

    context 'with record not matching the user' do
      let!(:wrong_member) { create(:member, email: 'wrong@member.com') }
      let!(:member_authentication) { create(:member_authentication, token: 'a_token', member: member) }

      subject { AuthTokenVerifier.new('a_token', wrong_member) }

      it 'is unsuccessful' 


      it 'returns error' 

    end
  end
end

