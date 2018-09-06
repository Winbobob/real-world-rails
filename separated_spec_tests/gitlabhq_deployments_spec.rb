require 'spec_helper'

describe API::V3::Deployments do
  let(:user)        { create(:user) }
  let(:non_member)  { create(:user) }
  let(:project)     { deployment.environment.project }
  let!(:deployment) { create(:deployment) }

  before do
    project.add_master(user)
  end

  shared_examples 'a paginated resources' do
    before do
      # Fires the request
      request
    end

    it 'has pagination headers' 

  end

  describe 'GET /projects/:id/deployments' do
    context 'as member of the project' do
      it_behaves_like 'a paginated resources' do
        let(:request) { get v3_api("/projects/#{project.id}/deployments", user) }
      end

      it 'returns projects deployments' 

    end

    context 'as non member' do
      it 'returns a 404 status code' 

    end
  end

  describe 'GET /projects/:id/deployments/:deployment_id' do
    context 'as a member of the project' do
      it 'returns the projects deployment' 

    end

    context 'as non member' do
      it 'returns a 404 status code' 

    end
  end
end

