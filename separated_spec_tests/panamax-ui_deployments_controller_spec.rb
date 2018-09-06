require 'spec_helper'

describe DeploymentsController do
  describe 'GET #new' do
    let(:fake_deployment_form) { double(:fake_deployment_form) }
    let(:fake_deployment_target) { double(:fake_deployment_target) }
    let(:fake_resource) { double(:fake_resource) }

    before do
      allow(DeploymentTarget).to receive(:find).and_return(fake_deployment_target)
      allow(DeploymentForm).to receive(:new).with(
        resource: fake_resource,
        deployment_target_id: '7'
      ).and_return(fake_deployment_form)
    end

    context 'when resource type is Template' do
      before do
        allow(Template).to receive(:find).and_return(fake_resource)
        get :new, deployment_target_id: 7, resource_id: '8', resource_type: 'Template'
      end

      it 'assigns the deployment_form object' 


      it 'assigns the deployment_target object' 


      it 'assigns the resource object' 


      it 'renders the new view' 

    end

    context 'when resource type is App' do
      before do
        allow(App).to receive(:find).and_return(fake_resource)
        get :new, deployment_target_id: 7, resource_id: '8', resource_type: 'App'
      end

      it 'assigns the resource object' 

    end

    context 'when resource type is not provided' do
      before do
        get :new, deployment_target_id: 7, resource_id: '8'
      end

      it 'raises an error' 

    end

  end

  describe 'POST #create' do
    let(:fake_deployment_form) { double(:fake_deployment_form) }
    let(:create_params) do
      {
        deployment_target_id: '7',
        resource_id: '8',
        resource_type: 'Template'
      }.stringify_keys
    end

    before do
      allow(DeploymentForm).to receive(:new).with(create_params).and_return(fake_deployment_form)
    end

    it 'calls save on the deployment form' 


    context 'when successful' do
      before do
        allow(fake_deployment_form).to receive(:save).and_return(true)
        post :create, deployment_form: create_params, deployment_target_id: 7
      end

      it 'redirects to the deployments list page' 


      it 'renders a success message' 

    end

    context 'when the save fails' do
      before do
        allow(fake_deployment_form).to receive(:save).and_return(false)
        post :create, deployment_form: create_params, deployment_target_id: 7
      end

      it 'redirects to the deployments list page' 


      it 'renders a success message' 

    end
  end

  describe 'GET #index' do
    let(:fake_target) { double(:fake_target) }
    let(:fake_deployments) { double(:fake_deployments) }

    before do
      allow(DeploymentTarget).to receive(:find).with('7').and_return(fake_target)
      allow(Deployment).to receive(:all).with(params: { deployment_target_id: '7' }).and_return(fake_deployments)
      get :index, deployment_target_id: 7
    end

    it 'renders the index view' 


    it 'assigns deployment_target' 


    it 'assigns deployments' 

  end

  describe 'DELETE #destroy' do
    let(:fake_deployment) { double(:fake_deployment, destroy: true) }

    before do
      allow(Deployment).to receive(:find).with('13', params: { deployment_target_id: '9' }).and_return(fake_deployment)
    end

    context 'html format' do
      before do
        delete :destroy, id: 13, deployment_target_id: 9
      end

      it 'deletes the target with the given id' 


      it 'responds with a http 302 status code' 


      it 'redirects to the index page' 

    end

    context 'json request' do
      before do
        delete :destroy, id: 13, deployment_target_id: 9, format: :json
      end

      it 'deletes the target with the given id' 


      it 'responds with a http 204 status code' 


      it 'returns an empty response' 

    end
  end

  describe 'GET #show' do
    let(:fake_deployment) { double(:fake_deployment) }

    before do
      allow(Deployment).to receive(:find).with('7', params: { deployment_target_id: '9' }).and_return(fake_deployment)
    end

    context 'json request' do
      before do
        get :show, id: 7, deployment_target_id: 9, format: :json
      end


      it 'returns a 200 status' 


      it 'responds with a json representation of the deployment' 

    end
  end

  describe 'POST #redeploy' do
    let(:new_deployment) { Deployment.new(id: 14) }
    let(:fake_deployment) { double(:fake_deployment, redeploy: new_deployment) }

    before do
      allow(Deployment).to receive(:find).with('13', params: { deployment_target_id: '9' }).and_return(fake_deployment)
    end

    before do
      post :redeploy, id: 13, deployment_target_id: 9, format: :json
    end

    it 'responds with a http 201 status code' 


    it 'returns an empty response' 


    it 'sets the response location to the deployments list page' 

  end
end

