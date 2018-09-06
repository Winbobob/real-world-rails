require 'spec_helper'

describe BookmarksController do
  include LoginMacros

  def it_redirects_to_user_login
    expect(response).to have_http_status(:redirect)
    expect(response).to redirect_to new_user_session_path
  end

  describe 'new' do
    context 'without javascript' do
      it 'should not return the form for anyone not logged in' 


      it 'should render the form if logged in' 

    end

    context 'with javascript' do
      it 'should render the bookmark_form_dynamic form if logged in' 

    end
  end

  describe 'edit' do
    context 'with javascript' do
      let(:bookmark) { FactoryGirl.create(:bookmark) }

      it 'should render the bookmark_form_dynamic form' 

    end
  end
end

