require 'spec_helper'

describe API::Environments do
  let(:user)          { create(:user) }
  let(:non_member)    { create(:user) }
  let(:project)       { create(:project, :private, namespace: user.namespace) }
  let!(:environment)  { create(:environment, project: project) }

  before do
    project.add_maintainer(user)
  end

  describe 'GET /projects/:id/environments' do
    context 'as member of the project' do
      it 'returns project environments' 

    end

    context 'as non member' do
      it 'returns a 404 status code' 

    end
  end

  describe 'POST /projects/:id/environments' do
    context 'as a member' do
      it 'creates a environment with valid params' 


      it 'requires name to be passed' 


      it 'returns a 400 if environment already exists' 


      it 'returns a 400 if slug is specified' 

    end

    context 'a non member' do
      it 'rejects the request' 


      it 'returns a 400 when the required params are missing' 

    end
  end

  describe 'PUT /projects/:id/environments/:environment_id' do
    it 'returns a 200 if name and external_url are changed' 


    it "won't allow slug to be changed" 


    it "won't update the external_url if only the name is passed" 


    it 'returns a 404 if the environment does not exist' 

  end

  describe 'DELETE /projects/:id/environments/:environment_id' do
    context 'as a maintainer' do
      it 'returns a 200 for an existing environment' 


      it 'returns a 404 for non existing id' 


      it_behaves_like '412 response' do
        let(:request) { api("/projects/#{project.id}/environments/#{environment.id}", user) }
      end
    end

    context 'a non member' do
      it 'rejects the request' 

    end
  end

  describe 'POST /projects/:id/environments/:environment_id/stop' do
    context 'as a maintainer' do
      context 'with a stoppable environment' do
        before do
          environment.update(state: :available)

          post api("/projects/#{project.id}/environments/#{environment.id}/stop", user)
        end

        it 'returns a 200' 


        it 'actually stops the environment' 

      end

      it 'returns a 404 for non existing id' 

    end

    context 'a non member' do
      it 'rejects the request' 

    end
  end
end

