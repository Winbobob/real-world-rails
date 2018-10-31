require 'rails_helper'

describe Admin::SiteTextsController do

  it "is a subclass of AdminController" 


  context 'while logged in as an admin' do
    before do
      @user = log_in(:admin)
    end

    context '.index' do
      it 'returns json' 

    end

    context '.show' do
      it 'returns a site text for a key that exists' 


      it 'returns not found for missing keys' 

    end

    context '#update and #revert' do
      after do
        TranslationOverride.delete_all
        I18n.reload!
      end

      describe 'failure' do
        before do
          I18n.backend.store_translations(:en, some_key: '%{first} %{second}')
        end

        it 'returns the right error message' 

      end

      it 'updates and reverts the key' 


      it 'returns not found for missing keys' 


      it 'logs the change' 


      it 'returns site texts for the correct locale' 

    end
  end

end

