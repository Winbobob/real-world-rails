require 'rails_helper'

describe SharesController do
  render_views

  let(:user) { Fabricate(:user) }
  before { sign_in user }

  describe 'GTE #show' do
    subject(:initial_state_json) { JSON.parse(assigns(:initial_state_json), symbolize_names: true) }
    subject(:body_classes) { assigns(:body_classes) }

    before { get :show, params: { title: 'test title', text: 'test text', url: 'url1 url2' } }

    it 'assigns json' 

  end
end

