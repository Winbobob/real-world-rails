require 'rails_helper'

describe ManifestsController do
  render_views

  describe 'GET #show' do
    before do
      get :show, format: :json
    end

    it 'returns http success' 

  end
end

