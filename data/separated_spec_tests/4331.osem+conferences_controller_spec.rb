# frozen_string_literal: true

require 'spec_helper'

describe Api::V1::ConferencesController do
  let!(:conf_one) { create(:conference, short_title: 'conf_one') }
  let!(:conf_two) { create(:conference, short_title: 'conf_two') }

  describe 'GET #index' do
    before(:each) do
      get :index, format: :json
      @json = JSON.parse(response.body)['conferences']
    end

    it 'returns successful response' 


    it 'returns all conferences' 


    it 'returns correct conferences' 

  end

  describe 'GET #show' do
    before(:each) do
      get :show, id: 'conf_two', format: :json
      @json = JSON.parse(response.body)['conferences']
    end

    it 'returns successful response' 


    it 'returns only one conference' 


    it 'returns the correct conference' 

  end
end

