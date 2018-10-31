require 'rails_helper'

describe EmailController do

  context '.preferences_redirect' do

    it 'requires you to be logged in' 


    context 'when logged in' do
      let!(:user) { log_in }

      it 'redirects to your user preferences' 

    end

  end

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

  context '.unsubscribe' do

    render_views

    it 'displays logo ut button if wrong user logged in' 


    it 'displays not found if key is not found' 


    it 'correctly handles mailing list mode' 


    it 'correctly handles digest unsubscribe' 


    it 'correctly handles watched categories' 


    it 'correctly handles watched first post categories' 

  end

end

