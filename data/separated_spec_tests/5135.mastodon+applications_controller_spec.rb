require 'rails_helper'

describe Settings::ApplicationsController do
  render_views

  let!(:user) { Fabricate(:user) }
  let!(:app) { Fabricate(:application, owner: user) }

  before do
    sign_in user, scope: :user
  end

  describe 'GET #index' do
    let!(:other_app) { Fabricate(:application) }

    it 'shows apps' 

  end

  describe 'GET #show' do
    it 'returns http success' 


    it 'returns 404 if you dont own app' 

  end

  describe 'GET #new' do
    it 'works' 

  end

  describe 'POST #create' do
    context 'success (passed scopes as a String)' do
      def call_create
        post :create, params: {
          doorkeeper_application: {
            name: 'My New App',
            redirect_uri: 'urn:ietf:wg:oauth:2.0:oob',
            website: 'http://google.com',
            scopes: 'read write follow'
          }
        }
        response
      end

      it 'creates an entry in the database' 


      it 'redirects back to applications page' 

    end

    context 'success (passed scopes as an Array)' do
      def call_create
        post :create, params: {
          doorkeeper_application: {
            name: 'My New App',
            redirect_uri: 'urn:ietf:wg:oauth:2.0:oob',
            website: 'http://google.com',
            scopes: [ 'read', 'write', 'follow' ]
          }
        }
        response
      end

      it 'creates an entry in the database' 


      it 'redirects back to applications page' 

    end

    context 'failure' do
      before do
        post :create, params: {
          doorkeeper_application: {
            name: '',
            redirect_uri: '',
            website: '',
            scopes: []
          }
        }
      end

      it 'returns http success' 


      it 'renders form again' 

    end
  end

  describe 'PATCH #update' do
    context 'success' do
      let(:opts) {
        {
          website: 'https://foo.bar/'
        }
      }

      def call_update
        patch :update, params: {
          id: app.id,
          doorkeeper_application: opts
        }
        response
      end

      it 'updates existing application' 


      it 'redirects back to applications page' 

    end

    context 'failure' do
      before do
        patch :update, params: {
          id: app.id,
          doorkeeper_application: {
            name: '',
            redirect_uri: '',
            website: '',
            scopes: []
          }
        }
      end

      it 'returns http success' 


      it 'renders form again' 

    end
  end

  describe 'destroy' do
    before do
      post :destroy, params: { id: app.id }
    end

    it 'redirects back to applications page' 


    it 'removes the app' 

  end

  describe 'regenerate' do
    let(:token) { user.token_for_app(app) }
    before do
      expect(token).to_not be_nil
      post :regenerate, params: { id: app.id }
    end

    it 'should create new token' 

  end
end

