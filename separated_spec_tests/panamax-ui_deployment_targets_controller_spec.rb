require 'spec_helper'

describe DeploymentTargetsController do
  let(:deployment_targets) { [double(:target1), double(:target2)] }
  let(:job_templates) { [double(:template1, vendor: 'CTL'), double(:template2, vendor: 'CTL')] }
  let(:job1) { double(:job1) }
  let(:job2) { double(:job2) }

  before do
    allow(job1).to receive(:with_step_status!).and_return(job1)
    allow(job2).to receive(:with_step_status!).and_return(job2)
    allow(job1).to receive(:with_log!).and_return(job1)
    allow(job2).to receive(:with_log!).and_return(job2)
    allow(job1).to receive(:with_template!).and_return(job1)
    allow(job2).to receive(:with_template!).and_return(job2)
  end

  describe 'GET #token' do
    let(:fake_target) { double(:fake_target, auth_blob: 'blob', name: 'prod! targ^0') }
    before do
      allow(DeploymentTarget).to receive(:find).with('7').and_return(fake_target)
    end

    it 'sends a file of the token' 


    it 'properly sanitizes names' 

  end

  describe 'GET #index' do
    before do
      allow(DeploymentTarget).to receive(:all).and_return(deployment_targets)
      allow(JobTemplate).to receive(:all).and_return(job_templates)
      allow(Job).to receive(:all).and_return([job1, job2])
      get :index
    end

    it 'assigns all the deployment targets' 


    it 'assigns all the jobs' 


    it 'assigns the job templates' 


    it 'renders the view' 

  end

  describe 'GET #select' do
    let(:deployment_targets) { [double(:target1), double(:target2) ] }
    let(:fake_resource) { { id: '7', type: 'Template' } }

    before do
      allow(DeploymentTarget).to receive(:all).and_return(deployment_targets)
    end

    context 'with a template id passed in ' do
      before do
        get :select, resource_id: 7, resource_type: 'Template'
      end

      it 'assigns all the deployment targets' 


      it 'renders the view in the plain layout' 


      it 'assigns the resource' 

    end
  end

  describe 'POST #create' do
    let(:deployment_target_params) do
      { 'deployment_target' =>
          { 'name' => 'foo',
            'auth_blob' => 'zcvasdfasdf'
          }
      }
    end

    context 'when create is successful' do
      let(:valid_target) { double(:valid_target, valid?: true) }

      before do
        allow(DeploymentTarget).to receive(:create).with(
                             'name' => 'foo',
                             'auth_blob' => 'zcvasdfasdf'
                           ).and_return(valid_target)
        post :create, deployment_target_params
      end

      it 'creates the deployment_target' 


      it 'shows a flash message for success' 

    end

    context 'when the deployment_target is invalid' do
      let(:invalid_target) { double(:invalid_target, model_name: 'DeploymentTarget', valid?: false) }

      before do
        allow(DeploymentTarget).to receive(:create).and_return(invalid_target)
        allow(DeploymentTarget).to receive(:all).and_return(deployment_targets)
        allow(JobTemplate).to receive(:all).and_return(job_templates)
        allow(Job).to receive(:all).and_return([job1, job2])
        post :create, deployment_target_params
      end

      it 'assigns the invalid deployment_target' 


      it 'assigns all the deployment targets' 


      it 'assigns all the jobs' 


      it 'assigns the job templates' 


      it 'renders the index view' 

    end
  end

  describe 'DELETE #destroy' do
    let(:fake_target) { double(:fake_target, destroy: true) }

    before do
      allow(DeploymentTarget).to receive(:find).with('13').and_return(fake_target)
    end

    context 'html format' do
      before do
        delete :destroy, id: 13
      end

      it 'deletes the target with the given id' 


      it 'responds with a http 302 status code' 


      it 'redirects to the index page' 

    end

    context 'json request' do
      before do
        delete :destroy, id: 13, format: :json
      end

      it 'deletes the target with the given id' 


      it 'responds with a http 204 status code' 


      it 'returns an empty response' 

    end
  end
end

