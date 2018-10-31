require 'rails_helper'

describe Gitlab::Checks::ProjectMoved, :clean_gitlab_redis_shared_state do
  let(:user) { create(:user) }
  let(:project) { create(:project) }

  describe '.fetch_message' do
    context 'with a redirect message queue' do
      it 'returns the redirect message' 


      it 'deletes the redirect message from redis' 

    end

    context 'with no redirect message queue' do
      it 'returns nil' 

    end
  end

  describe '#add_message' do
    it 'queues a redirect message' 


    it 'handles anonymous clones' 

  end

  describe '#message' do
    it 'returns a redirect message' 

  end
end

