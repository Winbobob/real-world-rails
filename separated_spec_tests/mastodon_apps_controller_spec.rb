require 'rails_helper'

RSpec.describe Api::V1::AppsController, type: :controller do
  render_views

  describe 'POST #create' do
    before do
      post :create, params: { client_name: 'Test app', redirect_uris: 'urn:ietf:wg:oauth:2.0:oob' }
    end

    it 'returns http success' 


    it 'creates an OAuth app' 


    it 'returns client ID and client secret' 

  end
end

