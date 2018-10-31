require 'rails_helper'

RSpec.describe JsonTemplateController, type: :controller do

  describe 'GET #index' do
    before do
      get :index
    end

    it 'yields a successful response' 


    it 'assigns @schema' 


    it 'renders the template' 

  end

  describe 'GET #show/:schema' do
    before do
      get :show, params: { schema: 'ccr_schema' }
    end

    it 'yields a successful response' 


    it 'assigns @schema' 


    it 'renders json' 

  end
end

