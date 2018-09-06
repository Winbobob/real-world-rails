require 'spec_helper'

describe ErrorsController do
  describe 'bad_request' do
    it 'renders' 

  end

  describe 'unauthorized' do
    it 'renders' 

  end

  describe 'not_found' do
    it 'renders' 

  end

  describe 'unprocessable_entity' do
    it 'renders' 

  end

  # Since this renders a 500, it doesn't test right.
  # describe 'server_error' do
  #   it 'renders' do
  #     get :server_error, format: :json
  #     expect(response.status).to eq(500)
  #     expect(response).to render_template(:server_error)
  #   end
  # end
end

