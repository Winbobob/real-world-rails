require 'rails_helper'

describe GithubClient do
  subject(:github_client) { GithubClient.new('nickname', 'token') }

  let(:client) { double(:client) }

  before do
    expect(github_client).to receive(:client).and_return(client)
  end

  describe '#user_repository_languages' do
    let(:repos) { ['lan-1', 'lan-2', 'lan-1'].map { |l| Hashie::Mash.new(language: l) } }
    let(:client) { double(:client, repos: repos) }

    it "maps the user's repository languages uniqueley" 

  end

  describe '#user_events' do
    it "maps the user's repository languages" 

  end

  describe '#user_organizations' do
    it "maps the user's repository languages" 

  end

  describe '#high_rate_limit' do
    it 'checks the available rate_limit' 

  end

  describe '#issues' do
    it "returns a repositories issues" 

  end

  describe '#commits' do
    it "returns a repositories commits" 

  end

  describe '#repository' do
    it "returns a repository" 

  end

  describe '#labels' do
    it "returns a repositories labels" 

  end
end

