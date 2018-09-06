require 'spec_helper'

describe RegistriesController do

  describe 'GET #index' do

    let(:fake_registries) do
      [
        double(:fake_registry),
        double(:fake_registry)
      ]
    end

    before do
      allow(Registry).to receive(:all).and_return(fake_registries)
    end

    it 'renders the index view' 


    it 'assigns registries' 

  end

  describe 'POST #create' do
    let(:fake_registry) { [Registry.new(name: 'test', endpoint_url: 'http://localhost:5000')] }
    let(:registry_form_params) do
      { 'registry' =>
          { 'name' => 'foo',
            'endpoint_url' => 'http://localhost:5000'
          }
      }
    end

    context 'when create is successful' do
      let(:valid_registry) { double(:valid_registry, valid?: true) }

      before do
        allow_any_instance_of(Registry).to receive(:save).and_return(valid_registry)
      end

      it 'creates the registry' 


      it 'shows a flash message for success' 

    end

    context 'when the registry is invalid' do
      let(:invalid_registry) { double(:invalid_registry, model_name: "Registry", valid?: false) }

      before do
        allow(Registry).to receive(:create).and_return(invalid_registry)
        post :create, registry_form_params
      end

      it "assigns the invalid registry" 


      it "renders the index view" 

    end

    context 'when create raises an exception' do

      before do
        allow_any_instance_of(Registry).to receive(:save).and_raise(StandardError.new)
      end

      it 'rescues an exception' 

    end
  end

  describe 'DELETE #destroy' do

    let(:fake_registry) { double(:fake_registry, destroy: true) }

    context 'when destroy is successful' do

      before do
        allow(Registry).to receive(:find).with('7').and_return(fake_registry)
      end

      it 'destroys the registry' 

    end

    context 'when destroy is not successful' do

      before do
        allow(Registry).to receive(:find).with('7').and_raise(StandardError.new)
      end

      it 'rescues an exception' 

    end
  end

  describe 'PUT #update' do

    let(:registry_params) { { 'name' => 'updated name' } }
    let(:fake_registry) { double(:fake_registry, update_attributes: true) }

    before do
      allow(Registry).to receive(:find).with('3').and_return(fake_registry)
    end

    it 'updates the given record' 


    context 'when update is successful' do
      it 'responds with a successful status code' 

    end

    context 'when the regsitry cannot be found' do
      before do
        allow(Registry).to receive(:find).and_raise(ActiveResource::ResourceNotFound.new(double('err', code: '404')))
      end

      it 'responds with a 302 status code' 

    end

    context 'as json' do
      it 'responds with the representation of the registry' 

    end
  end
end

