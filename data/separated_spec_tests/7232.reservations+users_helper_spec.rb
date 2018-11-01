# frozen_string_literal: true

require 'spec_helper'

RSpec.describe UsersHelper, type: :helper do
  describe '.tos_attestation' do
    let(:user1) { FactoryGirl.build_stubbed :user }
    let(:user2) { FactoryGirl.build_stubbed :user }

    it 'returns "I accept" when the user is acting on their own behalf' 


    it "returns 'User accepts' when the user is acting on another's behalf" 


    it 'returns "I accept" when the current user is not present' 

  end

  describe '.user_viewing_other_user?' do
    let(:user1) { FactoryGirl.build_stubbed :user }
    let(:user2) { FactoryGirl.build_stubbed :user }

    it 'returns true when a user is signed in and viewing another user' 


    it 'returns false when a user is signed in and viewing themselves' 


    it 'returns false when a user is not signed in' 

  end
end

