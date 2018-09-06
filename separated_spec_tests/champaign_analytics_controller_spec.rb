# frozen_string_literal: true

require 'rails_helper'

describe Api::AnalyticsController do
  describe 'GET #show' do
    let(:page) { double }

    before do
      allow(Analytics::Page).to receive(:new) { page }
      get :show, params: { page_id: '1', format: 'json' }
    end

    it 'assigns page' 


    it 'creates analytics object' 


    it 'renders json template' 

  end
end

