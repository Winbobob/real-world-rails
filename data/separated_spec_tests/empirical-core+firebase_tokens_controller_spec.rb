require 'rails_helper'

describe Api::V1::FirebaseTokensController, type: :controller do

  context 'POST #create' do
    let!(:app) { FirebaseApp.create!(name: 'foobar', secret: '12345abcde') }
    let!(:user) { create(:student) }

    context 'when accessing anonymously' do
      before do
        subject
      end

      def subject
        post :create, app: 'foobar'
      end

      it 'responds with 200' 


      it 'responds with a firebase token' 

    end

    context 'when authenticated via OAuth' do
      let(:application) { Doorkeeper::Application.create!(name: "MyFirebaseApp", redirect_uri: "https://app.com") }
      let(:token) { Doorkeeper::AccessToken.create! application_id: application.id, resource_owner_id: user.id }

      def subject
        post :create, app: 'foobar', access_token: token.token
      end

      it 'responds with 200' 


      it 'creates the token with the correct user info' 

    end

    context 'when the firebase app does not exist' do
      subject do
        post :create, app: 'nonexistent'
      end

      it 'responds with 404' 

    end
  end

  describe '#create_for_connet' do
    let!(:app) { FirebaseApp.create!(name: 'foobar', secret: '12345abcde') }
    let!(:user) { create(:student) }

    before do
      allow_any_instance_of(FirebaseApp).to receive(:connect_token_for) { "connect token" }
      subject
    end

    def subject
      post :create_for_connect, "json" => { "app" => 'foobar' }.to_json, format: :json
    end

    it 'should respond with the connect token' 

  end
end

