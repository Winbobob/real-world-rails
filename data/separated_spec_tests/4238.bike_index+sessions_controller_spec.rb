require 'spec_helper'

describe SessionsController do
  describe 'new' do
    context 'calls required things' do
      it 'renders and calls store_return_to' 

    end
    context 'setting return_to' do
      it 'actually sets it' 

    end
  end

  describe 'destroy' do
    it 'logs out the current user' 

  end

  describe 'create' do
    describe 'when user is found' do
      before do
        @user = FactoryGirl.create(:user, confirmed: true)
        expect(User).to receive(:fuzzy_email_find).and_return(@user)
      end

      describe 'when authentication works' do
        it 'authenticates' 


        it 'authenticates and redirects to admin' 


        it "redirects to discourse_authentication url if it's a valid oauth url" 


        it "redirects to return_to if it's a valid oauth url" 


        it 'redirects to facebook.com/bikeindex' 


        it 'does not redirect to a random facebook page' 


        it "doesn't redirect and clears the session if not a valid oauth url" 

      end

      it 'does not authenticate the user when user authentication fails' 

    end

    context 'unconfirmed' do
      let(:user) { FactoryGirl.create(:user, confirmed: false) }
      it 'does not log in unconfirmed users' 

      context 'with confirmed user_email' do
        it 'does not log them in either' 

      end
    end

    it 'does not log in the user when the user is not found' 

  end
end

