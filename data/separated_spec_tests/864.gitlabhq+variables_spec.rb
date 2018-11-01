require 'spec_helper'

describe API::Variables do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:project) { create(:project, creator_id: user.id) }
  let!(:maintainer) { create(:project_member, :maintainer, user: user, project: project) }
  let!(:developer) { create(:project_member, :developer, user: user2, project: project) }
  let!(:variable) { create(:ci_variable, project: project) }

  describe 'GET /projects/:id/variables' do
    context 'authorized user with proper permissions' do
      it 'returns project variables' 

    end

    context 'authorized user with invalid permissions' do
      it 'does not return project variables' 

    end

    context 'unauthorized user' do
      it 'does not return project variables' 

    end
  end

  describe 'GET /projects/:id/variables/:key' do
    context 'authorized user with proper permissions' do
      it 'returns project variable details' 


      it 'responds with 404 Not Found if requesting non-existing variable' 

    end

    context 'authorized user with invalid permissions' do
      it 'does not return project variable details' 

    end

    context 'unauthorized user' do
      it 'does not return project variable details' 

    end
  end

  describe 'POST /projects/:id/variables' do
    context 'authorized user with proper permissions' do
      it 'creates variable' 


      it 'creates variable with optional attributes' 


      it 'does not allow to duplicate variable key' 

    end

    context 'authorized user with invalid permissions' do
      it 'does not create variable' 

    end

    context 'unauthorized user' do
      it 'does not create variable' 

    end
  end

  describe 'PUT /projects/:id/variables/:key' do
    context 'authorized user with proper permissions' do
      it 'updates variable data' 


      it 'responds with 404 Not Found if requesting non-existing variable' 

    end

    context 'authorized user with invalid permissions' do
      it 'does not update variable' 

    end

    context 'unauthorized user' do
      it 'does not update variable' 

    end
  end

  describe 'DELETE /projects/:id/variables/:key' do
    context 'authorized user with proper permissions' do
      it 'deletes variable' 


      it 'responds with 404 Not Found if requesting non-existing variable' 

    end

    context 'authorized user with invalid permissions' do
      it 'does not delete variable' 

    end

    context 'unauthorized user' do
      it 'does not delete variable' 

    end
  end
end

