require 'rails_helper'

RSpec.describe EmailController do
  let(:user) { Fabricate(:user) }
  let(:topic) { Fabricate(:topic) }
  let(:private_topic) { Fabricate(:private_message_topic) }

  context '.perform unsubscribe' do
    it 'raises not found on invalid key' 


    it 'can fully unsubscribe' 


    it 'can disable mailing list' 


    it 'can disable digest' 


    it 'can unwatch topic' 


    it 'can mute topic' 


    it 'can unwatch category' 


    it 'can unwatch first post from category' 

  end

  describe '#unsubscribed' do
    describe 'when email is invalid' do
      it 'should return the right response' 

    end

    describe 'when topic is public' do
      it 'should return the right response' 

    end

    describe 'when topic is private' do
      it 'should return the right response' 

    end
  end

  context '#preferences_redirect' do
    it 'requires you to be logged in' 


    context 'when logged in' do
      let!(:user) { sign_in(Fabricate(:user)) }

      it 'redirects to your user preferences' 

    end
  end

  context '#unsubscribe' do
    it 'displays log out button if wrong user logged in' 


    it 'displays not found if key is not found' 


    it 'correctly handles mailing list mode' 


    it 'correctly handles digest unsubscribe' 


    it 'correctly handles watched categories' 


    it 'correctly handles watched first post categories' 

  end
end

