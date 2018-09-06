require 'spec_helper'

describe Gitlab::LegacyGithubImport::WikiFormatter do
  let(:project) do
    create(:project,
           namespace: create(:namespace, path: 'gitlabhq'),
           import_url: 'https://xxx@github.com/gitlabhq/sample.gitlabhq.git')
  end

  subject(:wiki) { described_class.new(project) }

  describe '#disk_path' do
    it 'appends .wiki to project path' 

  end

  describe '#import_url' do
    it 'returns URL of the wiki repository' 

  end
end

