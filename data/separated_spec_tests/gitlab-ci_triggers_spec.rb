require 'spec_helper'

describe API::API do
  include ApiHelpers

  describe 'POST /projects/:project_id/refs/:ref/trigger' do
    let!(:trigger_token) { 'secure token' }
    let!(:project) { FactoryGirl.create(:project) }
    let!(:project2) { FactoryGirl.create(:project) }
    let!(:trigger) { FactoryGirl.create(:trigger, project: project, token: trigger_token) }
    let(:options) {
      {
        token: trigger_token
      }
    }

    context 'Handles errors' do
      it 'should return bad request if token is missing' 


      it 'should return not found if project is not found' 


      it 'should return unauthorized if token is for different project' 

    end

    context 'Have a commit' do
      before do
        @commit = FactoryGirl.create(:commit, project: project)
      end

      it 'should create builds' 


      it 'should return bad request with no builds created if there\'s no commit for that ref' 


      context 'Validates variables' do
        let(:variables) {
          {'TRIGGER_KEY' => 'TRIGGER_VALUE'}
        }

        it 'should validate variables to be a hash' 


        it 'should validate variables needs to be a map of key-valued strings' 


        it 'create trigger request with variables' 

      end
    end
  end
end

