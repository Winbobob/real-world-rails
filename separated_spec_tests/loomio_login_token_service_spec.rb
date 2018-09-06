require 'rails_helper'

describe LoginTokenService do
  describe 'create' do
    let(:user) { create :user }
    let(:uri) { URI::parse "http://#{ENV['CANONICAL_HOST']}/explore" }
    let(:bad_uri) { URI::parse "http://badhost.biz/explore" }

    it 'creates a new login token' 


    it 'sends an email to the user' 


    it 'does nothing if the actor is not logged in' 


    it 'stores a redirect uri' 


    it 'does not store a redirect uri if the host is different' 

  end
end

