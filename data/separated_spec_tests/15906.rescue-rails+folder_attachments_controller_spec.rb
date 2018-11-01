require 'rails_helper'

describe FolderAttachmentsController do
  before :each do
    sign_in_as(user)
  end

  describe 'GET #index' do
    let!(:user) { create(:user, dl_resources: true, dl_locked_resources: false) }

    context 'logged in with standard folder access' do
      context 'when no search params are submitted' do
        it 'is successful' 

      end

      context 'when search params are submitted' do
        it 'is successful' 

      end
    end

    context 'logged in as no access user' do
      let!(:user) { create(:user, dl_resources: false) }

      it 'redirects to sign in page' 

    end
  end
end

