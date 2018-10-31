require 'spec_helper'

describe Admin::ApplicationsController do
  let(:admin) { create(:admin) }
  let(:application) { create(:oauth_application, owner_id: nil, owner_type: nil) }

  before do
    sign_in(admin)
  end

  describe 'GET #new' do
    it 'renders the application form' 

  end

  describe 'GET #edit' do
    it 'renders the application form' 

  end

  describe 'POST #create' do
    it 'creates the application' 


    it 'renders the application form on errors' 

  end

  describe 'PATCH #update' do
    it 'updates the application' 


    it 'renders the application form on errors' 

  end
end

