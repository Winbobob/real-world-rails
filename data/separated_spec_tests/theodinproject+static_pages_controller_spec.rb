require 'rails_helper'

RSpec.describe StaticPagesController do
  describe 'GET #home' do
    context 'guest user' do
      before do
        allow(controller).to receive(:current_user).and_return(nil)
      end

      it 'renders the home page' 

    end

    context 'when user is logged in' do
      let(:user) { double('User') }

      before do
        allow(controller).to receive(:current_user).and_return(user)
      end

      it 'redirects to the dashboard' 

    end
  end

  describe 'GET #about' do
    it 'renders the about page' 

  end

  describe 'GET #terms_of_use' do
    it 'renders the terms of use page' 

  end

  describe 'GET #success stories' do
    it 'renders the success stories page' 

  end
end

