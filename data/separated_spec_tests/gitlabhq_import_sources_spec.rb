require 'spec_helper'

describe Gitlab::ImportSources do
  describe '.options' do
    it 'returns a hash' 

  end

  describe '.values' do
    it 'returns an array' 

  end

  describe '.importer_names' do
    it 'returns an array of importer names' 

  end

  describe '.importer' do
    import_sources = {
      'github' => Gitlab::GithubImport::ParallelImporter,
      'bitbucket' => Gitlab::BitbucketImport::Importer,
      'gitlab' => Gitlab::GitlabImport::Importer,
      'google_code' => Gitlab::GoogleCodeImport::Importer,
      'fogbugz' => Gitlab::FogbugzImport::Importer,
      'git' => nil,
      'gitlab_project' => Gitlab::ImportExport::Importer,
      'gitea' => Gitlab::LegacyGithubImport::Importer
    }

    import_sources.each do |name, klass|
      it "returns #{klass} when given #{name}" 

    end
  end

  describe '.title' do
    import_sources = {
      'github' => 'GitHub',
      'bitbucket' => 'Bitbucket',
      'gitlab' => 'GitLab.com',
      'google_code' => 'Google Code',
      'fogbugz' => 'FogBugz',
      'git' => 'Repo by URL',
      'gitlab_project' => 'GitLab export',
      'gitea' => 'Gitea'
    }

    import_sources.each do |name, title|
      it "returns #{title} when given #{name}" 

    end
  end
end

