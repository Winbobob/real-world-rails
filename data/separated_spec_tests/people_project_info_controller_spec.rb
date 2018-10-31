require 'spec_helper'

describe ProjectInfoController do
  let(:admin_user) { create(:user, :admin) }

  before { sign_in(admin_user) }

  describe '#index' do
    render_views
    let(:projects_array) { ['Reality Royale', 'UPFitness', 'Access_Internal'] }

    before do
      allow_any_instance_of(Apiguru::ListProjects)
        .to receive(:call)
        .and_return(projects_array)
      get :index
    end

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes projects' 


    it 'displays projects on view' 

  end

  describe '#show' do
    render_views
    let(:project) { { name: 'ABC', project_active: true } }

    before do
      allow_any_instance_of(Apiguru::ShowProjectInfo)
        .to receive(:call)
        .and_return(project)
      get :show, name: 'ABC'
    end

    it 'responds successfully with an HTTP 200 status code' 


    it 'exposes project' 


    it 'displays project' 

  end
end

