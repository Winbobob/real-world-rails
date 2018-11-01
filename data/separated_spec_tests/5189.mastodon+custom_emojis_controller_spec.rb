# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::CustomEmojisController, type: :controller do
  render_views

  describe 'GET #index' do
    before do
      Fabricate(:custom_emoji)
      get :index
    end

    it 'returns http success' 

  end
end

