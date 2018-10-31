require 'spec_helper'

describe API::GroupVariables do
  let(:group) { create(:group) }
  let(:user) { create(:user) }

  describe 'GET /groups/:id/variables' do
    let!(:variable) { create(:ci_group_variable, group: group) }

    context 'authorized user with proper permissions' do
      before do
        group.add_master(user)
      end

      it 'returns group variables' 

    end

    context 'authorized user with invalid permissions' do
      it 'does not return group variables' 

    end

    context 'unauthorized user' do
      it 'does not return group variables' 

    end
  end

  describe 'GET /groups/:id/variables/:key' do
    let!(:variable) { create(:ci_group_variable, group: group) }

    context 'authorized user with proper permissions' do
      before do
        group.add_master(user)
      end

      it 'returns group variable details' 


      it 'responds with 404 Not Found if requesting non-existing variable' 

    end

    context 'authorized user with invalid permissions' do
      it 'does not return group variable details' 

    end

    context 'unauthorized user' do
      it 'does not return group variable details' 

    end
  end

  describe 'POST /groups/:id/variables' do
    context 'authorized user with proper permissions' do
      let!(:variable) { create(:ci_group_variable, group: group) }

      before do
        group.add_master(user)
      end

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

  describe 'PUT /groups/:id/variables/:key' do
    let!(:variable) { create(:ci_group_variable, group: group) }

    context 'authorized user with proper permissions' do
      before do
        group.add_master(user)
      end

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

  describe 'DELETE /groups/:id/variables/:key' do
    let!(:variable) { create(:ci_group_variable, group: group) }

    context 'authorized user with proper permissions' do
      before do
        group.add_master(user)
      end

      it 'deletes variable' 


      it 'responds with 404 Not Found if requesting non-existing variable' 


      it_behaves_like '412 response' do
        let(:request) { api("/groups/#{group.id}/variables/#{variable.key}", user) }
      end
    end

    context 'authorized user with invalid permissions' do
      it 'does not delete variable' 

    end

    context 'unauthorized user' do
      it 'does not delete variable' 

    end
  end
end

