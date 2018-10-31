require 'rails_helper'

describe CommitsHelper do
  describe 'commit_author_link' do
    it 'escapes the author email' 


    it 'escapes the author name' 

  end

  describe 'commit_committer_link' do
    it 'escapes the committer email' 


    it 'escapes the commiter name' 

  end

  describe '#view_on_environment_button' do
    let(:project) { create(:project) }
    let(:environment) { create(:environment, external_url: 'http://example.com') }
    let(:path) { 'source/file.html' }
    let(:sha) { RepoHelpers.sample_commit.id }

    before do
      allow(environment).to receive(:external_url_for).with(path, sha).and_return('http://example.com/file.html')
    end

    it 'returns a link tag linking to the file in the environment' 

  end
end

