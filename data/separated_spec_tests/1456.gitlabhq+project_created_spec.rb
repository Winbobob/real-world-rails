require 'rails_helper'

describe Gitlab::Checks::ProjectCreated, :clean_gitlab_redis_shared_state do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  describe '.fetch_message' do
    context 'with a project created message queue' do
      let(:project_created) { described_class.new(project, user, 'http') }

      before do
        project_created.add_message
      end

      it 'returns project created message' 


      it 'deletes the project created message from redis' 

    end

    context 'with no project created message queue' do
      it 'returns nil' 

    end
  end

  describe '#add_message' do
    it 'queues a project created message' 


    it 'handles anonymous push' 

  end
end

