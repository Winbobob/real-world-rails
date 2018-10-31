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
      'bitbucket_server' => Gitlab::BitbucketServerImport::Importer,
      'gitlab' => Gitlab::GitlabImport::Importer,
      'google_code' => Gitlab::GoogleCodeImport::Importer,
      'fogbugz' => Gitlab::FogbugzImport::Importer,
      'git' => nil,
      'gitlab_project' => Gitlab::ImportExport::Importer,
      'gitea' => Gitlab::LegacyGithubImport::Importer,
      'manifest' => nil
    }

    import_sources.each do |name, klass|
      it "returns #{klass} when given #{name}" 

    end
  end

  describe '.title' do
    import_sources = {
      'github' => 'GitHub',
      'bitbucket' => 'Bitbucket Cloud',
      'bitbucket_server' => 'Bitbucket Server',
      'gitlab' => 'GitLab.com',
      'google_code' => 'Google Code',
      'fogbugz' => 'FogBugz',
      'git' => 'Repo by URL',
      'gitlab_project' => 'GitLab export',
      'gitea' => 'Gitea',
      'manifest' => 'Manifest file'
    }

    import_sources.each do |name, title|
      it "returns #{title} when given #{name}" 

    end
  end

  describe 'imports_repository? checker' do
    let(:allowed_importers) { %w[github gitlab_project bitbucket_server] }

    it 'fails if any importer other than the allowed ones implements this method' 


    def failure_message(importers_class_names)
      <<-MSG
        It looks like the #{importers_class_names.join(', ')} importers implements its own way to import the repository.
        That means that the lfs object download must be handled for each of them. You can use 'LfsImportService' and
        'LfsDownloadService' to implement it. After that, add the importer name to the list of allowed importers in this spec.
      MSG
    end
  end
end

