require 'spec_helper'

describe API::DeployKeys do
  let(:user)        { create(:user) }
  let(:admin)       { create(:admin) }
  let(:project)     { create(:project, creator_id: user.id) }
  let(:project2)    { create(:project, creator_id: user.id) }
  let(:deploy_key)  { create(:deploy_key, public: true) }

  let!(:deploy_keys_project) do
    create(:deploy_keys_project, project: project, deploy_key: deploy_key)
  end

  describe 'GET /deploy_keys' do
    context 'when unauthenticated' do
      it 'returns authentication error' 

    end

    context 'when authenticated as non-admin user' do
      it 'returns a 403 error' 

    end

    context 'when authenticated as admin' do
      it 'returns all deploy keys' 

    end
  end

  describe 'GET /projects/:id/deploy_keys' do
    before do
      deploy_key
    end

    it 'returns array of ssh keys' 

  end

  describe 'GET /projects/:id/deploy_keys/:key_id' do
    it 'returns a single key' 


    it 'returns 404 Not Found with invalid ID' 

  end

  describe 'POST /projects/:id/deploy_keys' do
    it 'does not create an invalid ssh key' 


    it 'does not create a key without title' 


    it 'creates new ssh key' 


    it 'returns an existing ssh key when attempting to add a duplicate' 


    it 'joins an existing ssh key to a new project' 


    it 'accepts can_push parameter' 

  end

  describe 'PUT /projects/:id/deploy_keys/:key_id' do
    let(:private_deploy_key) { create(:another_deploy_key, public: false) }
    let(:project_private_deploy_key) do
      create(:deploy_keys_project, project: project, deploy_key: private_deploy_key)
    end

    it 'updates a public deploy key as admin' 


    it 'does not update a public deploy key as non admin' 


    it 'does not update a private key with invalid title' 


    it 'updates a private ssh key with correct attributes' 

  end

  describe 'DELETE /projects/:id/deploy_keys/:key_id' do
    before do
      deploy_key
    end

    it 'deletes existing key' 


    it 'returns 404 Not Found with invalid ID' 


    it_behaves_like '412 response' do
      let(:request) { api("/projects/#{project.id}/deploy_keys/#{deploy_key.id}", admin) }
    end
  end

  describe 'POST /projects/:id/deploy_keys/:key_id/enable' do
    let(:project2) { create(:project) }

    context 'when the user can admin the project' do
      it 'enables the key' 

    end

    context 'when authenticated as non-admin user' do
      it 'returns a 404 error' 

    end
  end
end

