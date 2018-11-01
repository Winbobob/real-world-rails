# frozen_string_literal: true

require 'rails_helper'

describe PluginsController do
  let(:plugin) { instance_double('Plugins::Petition') }
  let(:page)   { instance_double('Page', id: 5) }

  before do
    allow(Plugins).to receive(:find_for) { plugin }
    allow(Page).to receive(:find) { page }
    get :show, params: { id: '1', page_id: '2', type: 'example' }
  end

  describe 'GET #show' do
    it 'renders show' 


    it 'finds campaign page' 


    it 'finds plugin' 

  end
end

