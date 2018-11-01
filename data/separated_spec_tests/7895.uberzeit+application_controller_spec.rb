require 'spec_helper'

describe ApplicationController do
  controller do
    def index
      render nothing: true
    end
  end

  let(:user) { FactoryGirl.create(:user) }

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    before do
      test_sign_in user
    end

    it 'won\'t redirect to login' 


    context 'for deactivated users' do
      let(:user) { FactoryGirl.create(:user, active: false) }

      it 'denies access' 

    end
  end

end


