require 'spec_helper'

describe Profiles::PreferencesController do
  let(:user) { create(:user) }

  before do
    sign_in(user)

    allow(subject).to receive(:current_user).and_return(user)
  end

  describe 'GET show' do
    it 'renders' 


    it 'assigns user' 

  end

  describe 'PATCH update' do
    def go(params: {}, format: :js)
      params.reverse_merge!(
        color_scheme_id: '1',
        dashboard: 'stars',
        theme_id: '1'
      )

      patch :update, user: params, format: format
    end

    context 'on successful update' do
      it 'sets the flash' 


      it "changes the user's preferences" 

    end

    context 'on failed update' do
      it 'sets the flash' 

    end

    context 'on invalid dashboard setting' do
      it 'sets the flash' 

    end

    context 'as js' do
      it 'renders' 

    end

    context 'as html' do
      it 'redirects' 

    end
  end
end

