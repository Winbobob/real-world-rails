require 'spec_helper'

describe API::V3::Triggers do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:trigger_token) { 'secure_token' }
  let!(:project) { create(:project, :repository, creator: user) }
  let!(:master) { create(:project_member, :master, user: user, project: project) }
  let!(:developer) { create(:project_member, :developer, user: user2, project: project) }

  let!(:trigger) do
    create(:ci_trigger, project: project, token: trigger_token, owner: user)
  end

  describe 'POST /projects/:project_id/trigger' do
    let!(:project2) { create(:project) }
    let(:options) do
      {
        token: trigger_token
      }
    end

    before do
      stub_ci_pipeline_to_return_yaml_file
    end

    context 'Handles errors' do
      it 'returns bad request if token is missing' 


      it 'returns not found if project is not found' 


      it 'returns unauthorized if token is for different project' 

    end

    context 'Have a commit' do
      let(:pipeline) { project.pipelines.last }

      it 'creates builds' 


      it 'returns bad request with no builds created if there\'s no commit for that ref' 


      context 'Validates variables' do
        let(:variables) do
          { 'TRIGGER_KEY' => 'TRIGGER_VALUE' }
        end

        it 'validates variables to be a hash' 


        it 'validates variables needs to be a map of key-valued strings' 


        it 'creates trigger request with variables' 

      end
    end

    context 'when triggering a pipeline from a trigger token' do
      it 'creates builds from the ref given in the URL, not in the body' 


      context 'when ref contains a dot' do
        it 'creates builds from the ref given in the URL, not in the body' 

      end
    end
  end

  describe 'GET /projects/:id/triggers' do
    context 'authenticated user with valid permissions' do
      it 'returns list of triggers' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not return triggers list' 

    end

    context 'unauthenticated user' do
      it 'does not return triggers list' 

    end
  end

  describe 'GET /projects/:id/triggers/:token' do
    context 'authenticated user with valid permissions' do
      it 'returns trigger details' 


      it 'responds with 404 Not Found if requesting non-existing trigger' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not return triggers list' 

    end

    context 'unauthenticated user' do
      it 'does not return triggers list' 

    end
  end

  describe 'POST /projects/:id/triggers' do
    context 'authenticated user with valid permissions' do
      it 'creates trigger' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not create trigger' 

    end

    context 'unauthenticated user' do
      it 'does not create trigger' 

    end
  end

  describe 'DELETE /projects/:id/triggers/:token' do
    context 'authenticated user with valid permissions' do
      it 'deletes trigger' 


      it 'responds with 404 Not Found if requesting non-existing trigger' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not delete trigger' 

    end

    context 'unauthenticated user' do
      it 'does not delete trigger' 

    end
  end
end

