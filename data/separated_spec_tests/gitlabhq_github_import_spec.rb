require 'spec_helper'

describe Gitlab::GithubImport do
  let(:project) { double(:project) }

  describe '.new_client_for' do
    it 'returns a new Client with a custom token' 


    it 'returns a new Client with a token stored in the import data' 

  end

  describe '.insert_and_return_id' do
    let(:attributes) { { iid: 1, title: 'foo' } }
    let(:project) { create(:project) }

    context 'on PostgreSQL' do
      it 'returns the ID returned by the query' 

    end

    context 'on MySQL' do
      it 'uses a separate query to retrieve the ID' 

    end
  end

  describe '.ghost_user_id', :clean_gitlab_redis_cache do
    it 'returns the ID of the ghost user' 


    it 'caches the ghost user ID' 

  end
end

