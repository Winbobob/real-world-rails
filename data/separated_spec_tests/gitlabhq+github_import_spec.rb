require 'spec_helper'

describe Gitlab::GithubImport do
  let(:project) { double(:project) }

  describe '.new_client_for' do
    it 'returns a new Client with a custom token' 


    it 'returns a new Client with a token stored in the import data' 

  end

  describe '.ghost_user_id', :clean_gitlab_redis_cache do
    it 'returns the ID of the ghost user' 


    it 'caches the ghost user ID' 

  end
end

