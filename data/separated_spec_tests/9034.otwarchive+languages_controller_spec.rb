require 'spec_helper'

describe LanguagesController do
  include LoginMacros
  include RedirectExpectationHelper

  let(:admin) { create(:admin) }

  describe 'GET index' do
    it 'renders the index template' 

  end

  describe 'GET show' do
    it 'renders the show template' 

  end

  describe 'GET new' do
    it 'renders the new template' 

  end

  describe 'POST create' do
    before do
      fake_login_admin(admin)
      post :create, params: {
        language: {
          name: 'Suomi',
          short: 'fi',
          support_available: false,
          abuse_support_available: false,
          sortable_name: 'su'
        }
      }
    end

    it 'creates the new language' 


    it 'redirects to languages_path with notice' 

  end

  describe 'GET edit' do
    it 'renders the edit template' 

  end

  describe 'PUT update' do
    let(:finnish) { Language.create(name: 'Suomi', short: 'fi') }

    before do
      fake_login_admin(admin)
      put :update, params: {
        id: finnish.short,
        language: {
          name: 'Suomi',
          short: 'fi',
          support_available: true,
          abuse_support_available: false,
          sortable_name: 'su'
        }
      }
    end

    it 'updates the language' 


    it 'redirects and returns success message' 

  end
end

