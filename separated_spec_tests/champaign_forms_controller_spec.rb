# frozen_string_literal: true

require 'rails_helper'

describe Plugins::FormsController do
  let(:user) { instance_double('User', id: 1) }
  let(:petition) { build :plugins_petition }

  before do
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
    allow(Plugins).to receive(:find_for).and_return(petition)
  end

  describe 'GET show' do
    let(:params) { { params: { plugin_type: 'petition', plugin_id: '3' } } }

    before :each do
      get :show, params
    end

    it 'finds the plugin' 


    it 'renders the form preview' 

  end

  describe 'POST create' do
    let(:params) { { params: { master_id: '2', plugin_type: 'petition', plugin_id: '3' } } }
    let(:first_form) { instance_double('Form', id: 1, master: true) }
    let(:second_form) { instance_double('Form', id: 7, master: false) }

    before do
      allow(Form).to receive(:find).and_return(first_form)
      allow(FormDuplicator).to receive(:duplicate).and_return(second_form)
      allow(petition).to receive(:update_form)
      request.accept = 'application/json'
      post :create, params
    end

    it 'finds form by form_id' 


    it 'finds plugin by plugin type and id' 


    it 'duplicates the form' 


    it 'calls plugin.update_form with the duplicated form' 


    it 'returns the form rendered as html in a json blob' 

  end

  describe 'strong params' do
    let(:params) { { params: { master_id: '2', plugin_type: 'petition', plugin_id: '3', form_id: 'disallowed' } } }

    it 'are used for POST create' 


    it 'are used for GET show' 

  end
end

