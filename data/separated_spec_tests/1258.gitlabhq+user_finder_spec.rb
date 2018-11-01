require 'spec_helper'

describe Gitlab::GithubImport::UserFinder, :clean_gitlab_redis_cache do
  let(:project) { create(:project) }
  let(:client) { double(:client) }
  let(:finder) { described_class.new(project, client) }

  describe '#author_id_for' do
    it 'returns the user ID for the author of an object' 


    it 'returns the ID of the project creator if no user ID could be found' 


    it 'returns the ID of the ghost user when the object has no user' 


    it 'returns the ID of the ghost user when the given object is nil' 

  end

  describe '#assignee_id_for' do
    it 'returns the user ID for the assignee of an issuable' 


    it 'returns nil if the issuable does not have an assignee' 

  end

  describe '#user_id_for' do
    it 'returns the user ID for the given user' 

  end

  describe '#find' do
    let(:user) { create(:user) }

    before do
      allow(finder).to receive(:email_for_github_username)
        .and_return(user.email)
    end

    context 'without a cache' do
      before do
        allow(finder).to receive(:find_from_cache).and_return([false, nil])
        expect(finder).to receive(:find_id_from_database).and_call_original
      end

      it 'finds a GitLab user for a GitHub user ID' 


      it 'finds a GitLab user for a GitHub Email address' 

    end

    context 'with a cache' do
      it 'returns the cached user ID' 


      it 'does not query the database if the cache key exists but is empty' 

    end
  end

  describe '#find_from_cache' do
    it 'retrieves a GitLab user ID for a GitHub user ID' 


    it 'retrieves a GitLab user ID for a GitHub Email address' 


    it 'does not query the cache for an Email address when none is given' 

  end

  describe '#find_id_from_database' do
    let(:user) { create(:user) }

    it 'returns the GitLab user ID for a GitHub user ID' 


    it 'returns the GitLab user ID for a GitHub Email address' 

  end

  describe '#email_for_github_username' do
    let(:email) { 'kittens@example.com' }

    context 'when an Email address is cached' do
      it 'reads the Email address from the cache' 

    end

    context 'when an Email address is not cached' do
      let(:user) { double(:user, email: email) }

      it 'retrieves the Email address from the GitHub API' 


      it 'caches the Email address when an Email address is available' 


      it 'returns nil if the user does not exist' 

    end
  end

  describe '#cached_id_for_github_id' do
    let(:id) { 4 }

    it 'reads a user ID from the cache' 


    it 'reads a non existing cache key' 

  end

  describe '#cached_id_for_github_email' do
    let(:email) { 'kittens@example.com' }

    it 'reads a user ID from the cache' 


    it 'reads a non existing cache key' 

  end

  describe '#id_for_github_id' do
    let(:id) { 4 }

    it 'queries and caches the user ID for a given GitHub ID' 


    it 'caches a nil value if no ID could be found' 

  end

  describe '#id_for_github_email' do
    let(:email) { 'kittens@example.com' }

    it 'queries and caches the user ID for a given Email address' 


    it 'caches a nil value if no ID could be found' 

  end

  describe '#query_id_for_github_id' do
    it 'returns the ID of the user for the given GitHub user ID' 


    it 'returns nil when no user ID could be found' 

  end

  describe '#query_id_for_github_email' do
    it 'returns the ID of the user for the given Email address' 


    it 'returns nil if no user ID could be found' 

  end

  describe '#read_id_from_cache' do
    it 'reads an ID from the cache' 


    it 'reads a cache key with an empty value' 


    it 'reads a cache key that does not exist' 

  end
end

