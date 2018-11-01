require 'spec_helper'

describe API::Applications, :api do
  include ApiHelpers

  let(:admin_user) { create(:user, admin: true) }
  let(:user) { create(:user, admin: false) }
  let!(:application) { create(:application, name: 'another_application', redirect_uri: 'http://other_application.url', scopes: '') }

  describe 'POST /applications' do
    context 'authenticated and authorized user' do
      it 'creates and returns an OAuth application' 


      it 'does not allow creating an application with the wrong redirect_uri format' 


      it 'does not allow creating an application without a name' 


      it 'does not allow creating an application without a redirect_uri' 


      it 'does not allow creating an application without scopes' 

    end

    context 'authorized user without authorization' do
      it 'does not create application' 

    end

    context 'non-authenticated user' do
      it 'does not create application' 

    end
  end

  describe 'GET /applications' do
    context 'authenticated and authorized user' do
      it 'can list application' 

    end

    context 'authorized user without authorization' do
      it 'cannot list application' 

    end

    context 'non-authenticated user' do
      it 'cannot list application' 

    end
  end

  describe 'DELETE /applications/:id' do
    context 'authenticated and authorized user' do
      it 'can delete an application' 

    end

    context 'authorized user without authorization' do
      it 'cannot delete an application' 

    end

    context 'non-authenticated user' do
      it 'cannot delete an application' 

    end
  end
end

