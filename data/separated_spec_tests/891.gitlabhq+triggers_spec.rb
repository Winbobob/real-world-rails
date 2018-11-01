require 'spec_helper'

describe API::Triggers do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:trigger_token) { 'secure_token' }
  let!(:trigger_token_2) { 'secure_token_2' }
  let!(:project) { create(:project, :repository, creator: user) }
  let!(:maintainer) { create(:project_member, :maintainer, user: user, project: project) }
  let!(:developer) { create(:project_member, :developer, user: user2, project: project) }
  let!(:trigger) { create(:ci_trigger, project: project, token: trigger_token, owner: user) }
  let!(:trigger2) { create(:ci_trigger, project: project, token: trigger_token_2, owner: user2) }
  let!(:trigger_request) { create(:ci_trigger_request, trigger: trigger, created_at: '2015-01-01 12:13:14') }

  describe 'POST /projects/:project_id/trigger/pipeline' do
    let!(:project2) { create(:project, :repository) }
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

    end

    context 'Have a commit' do
      let(:pipeline) { project.pipelines.last }

      it 'creates pipeline' 


      it 'returns bad request with no pipeline created if there\'s no commit for that ref' 


      context 'Validates variables' do
        let(:variables) do
          { 'TRIGGER_KEY' => 'TRIGGER_VALUE' }
        end

        it 'validates variables to be a hash' 


        it 'validates variables needs to be a map of key-valued strings' 


        it 'creates trigger request with variables' 

      end

      context 'when legacy trigger' do
        before do
          trigger.update(owner: nil)
        end

        it 'creates pipeline' 

      end
    end

    context 'when triggering a pipeline from a trigger token' do
      it 'does not leak the presence of project when token is for different project' 


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

  describe 'GET /projects/:id/triggers/:trigger_id' do
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
      context 'with required parameters' do
        it 'creates trigger' 

      end

      context 'without required parameters' do
        it 'does not create trigger' 

      end
    end

    context 'authenticated user with invalid permissions' do
      it 'does not create trigger' 

    end

    context 'unauthenticated user' do
      it 'does not create trigger' 

    end
  end

  describe 'PUT /projects/:id/triggers/:trigger_id' do
    context 'authenticated user with valid permissions' do
      let(:new_description) { 'new description' }

      it 'updates description' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not update trigger' 

    end

    context 'unauthenticated user' do
      it 'does not update trigger' 

    end
  end

  describe 'POST /projects/:id/triggers/:trigger_id/take_ownership' do
    context 'authenticated user with valid permissions' do
      it 'updates owner' 

    end

    context 'authenticated user with invalid permissions' do
      it 'does not update owner' 

    end

    context 'unauthenticated user' do
      it 'does not update owner' 

    end
  end

  describe 'DELETE /projects/:id/triggers/:trigger_id' do
    context 'authenticated user with valid permissions' do
      it 'deletes trigger' 


      it 'responds with 404 Not Found if requesting non-existing trigger' 


      it_behaves_like '412 response' do
        let(:request) { api("/projects/#{project.id}/triggers/#{trigger.id}", user) }
      end
    end

    context 'authenticated user with invalid permissions' do
      it 'does not delete trigger' 

    end

    context 'unauthenticated user' do
      it 'does not delete trigger' 

    end
  end
end

