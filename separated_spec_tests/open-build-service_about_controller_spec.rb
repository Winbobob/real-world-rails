require 'rails_helper'
require 'webmock/rspec'

RSpec.describe AboutController, type: :controller do
  render_views # NOTE: This is required otherwise Suse::Validator.validate will fail

  describe '#index' do
    before do
      get :index, params: { format: :xml }
    end

    it { expect(response).to have_http_status(:success) }

    it 'assigns @api_revision' 

  end
end

