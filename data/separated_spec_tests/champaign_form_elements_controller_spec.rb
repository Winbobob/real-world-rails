# frozen_string_literal: true

require 'rails_helper'

describe FormElementsController do
  let(:element) { instance_double('FormElement', valid?: true) }
  let(:form) { instance_double('Form') }

  include_examples 'session authentication'

  describe 'POST #create' do
    let(:params) { { label: 'Label', data_type: 'text', required: 'true' } }

    before do
      allow(Form).to receive(:find) { form }
      allow(FormElementBuilder).to receive(:create) { element }

      post :create, params: { form_id: '1', form_element: params }
    end

    it 'authenticates session' 


    it 'finds form' 


    it 'creates form element' 


    context 'successfully created' do
      it 'renders element partial' 

    end
  end

  describe 'POST #sort' do
    before do
      allow(Form).to receive(:find) { form }
      allow(form).to receive(:touch)
      allow(form).to receive(:form_elements) { [] }

      post :sort, params: { form_id: '1', form_element_ids: '' }
    end

    it 'authenticates session' 


    it 'finds form' 


    it 'touches form' 

  end

  describe 'DELETE #destroy' do
    before do
      allow(FormElement).to receive(:includes) { FormElement }
      allow(FormElement).to receive(:find) { element }
      allow(element).to receive(:destroy)
      allow(element).to receive(:can_destroy?) { should_destroy }

      delete :destroy, params: { form_id: '1', id: '2', format: :json }
    end

    describe 'successfully' do
      let(:should_destroy) { true }

      it 'authenticates session' 


      it 'finds form element' 


      it 'destroys element' 


      it 'checks that the element can be destroyed' 


      it 'responds with 200' 

    end

    describe 'unsuccessfully' do
      let(:element) { instance_double('FormElement', valid?: true, errors: { base: ['cannot be deleted'] }) }
      let(:should_destroy) { false }

      before :each do
        allow(element).to receive(:errors) { { base: ['cannot be deleted'] } }
      end

      let(:should_destroy) { false }

      it 'does not destroy element' 


      it 'responds with 422' 


      it 'includes errors' 

    end
  end
end

