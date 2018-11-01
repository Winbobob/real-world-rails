# frozen_string_literal: true

require 'rails_helper'

describe Plugins::SurveysController do
  let(:user) { instance_double('User', id: 1) }
  let(:survey) { instance_double(Plugins::Survey, forms: forms, id: 7) }
  let(:forms) do
    [
      instance_double('Form', position: 0, id: 5),
      instance_double('Form', position: 1, id: 4),
      instance_double('Form', position: 2, id: 3)
    ]
  end

  include_examples 'session authentication'

  before do
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
    allow(Plugins).to receive(:find_for).and_return(survey)
    allow(Form).to receive(:new).and_return(new_form)
  end

  describe 'POST add_form' do
    let(:params) { { params: { plugin_id: survey.id, format: 'js' } } }
    let(:new_form) { instance_double(Form, save: true, errors: []) }

    before :each do
      post :add_form, params
    end

    it 'finds the plugin' 


    it 'instantiates a form' 


    describe 'success' do
      it 'renders the form preview' 


      it 'responds with 200' 

    end

    describe 'failure' do
      let(:new_form) { instance_double(Form, save: false, errors: [:an_error]) }

      it 'responds with 422' 


      it 'does not render add_form' 

    end
  end
end
