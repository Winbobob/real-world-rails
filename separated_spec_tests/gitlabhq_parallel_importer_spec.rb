require 'spec_helper'

describe Gitlab::GithubImport::ParallelImporter do
  describe '.async?' do
    it 'returns true' 

  end

  describe '#execute', :clean_gitlab_redis_shared_state do
    let(:project) { create(:project) }
    let(:importer) { described_class.new(project) }

    before do
      create(:import_state, :started, project: project)

      expect(Gitlab::GithubImport::Stage::ImportRepositoryWorker)
        .to receive(:perform_async)
        .with(project.id)
        .and_return('123')
    end

    it 'schedules the importing of the repository' 


    it 'sets the JID in Redis' 


    it 'updates the import JID of the project' 

  end
end

