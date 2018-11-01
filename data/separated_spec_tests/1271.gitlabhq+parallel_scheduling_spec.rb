require 'spec_helper'

describe Gitlab::GithubImport::ParallelScheduling do
  let(:importer_class) do
    Class.new do
      include(Gitlab::GithubImport::ParallelScheduling)

      def collection_method
        :issues
      end
    end
  end

  let(:project) { double(:project, id: 4, import_source: 'foo/bar') }
  let(:client) { double(:client) }

  describe '#parallel?' do
    it 'returns true when running in parallel mode' 


    it 'returns false when running in sequential mode' 

  end

  describe '#execute' do
    it 'imports data in parallel when running in parallel mode' 


    it 'imports data in parallel when running in sequential mode' 


    it 'expires the cache used for tracking already imported objects' 

  end

  describe '#sequential_import' do
    let(:importer) { importer_class.new(project, client, parallel: false) }

    it 'imports data in sequence' 

  end

  describe '#parallel_import' do
    let(:importer) { importer_class.new(project, client) }

    it 'imports data in parallel' 

  end

  describe '#each_object_to_import' do
    let(:importer) { importer_class.new(project, client) }
    let(:object) { double(:object) }

    before do
      expect(importer)
        .to receive(:collection_options)
        .and_return({ state: 'all' })
    end

    it 'yields every object to import' 


    it 'resumes from the last page' 


    it 'does not yield any objects if the page number was not set' 


    it 'does not yield the object if it was already imported' 

  end

  describe '#already_imported?', :clean_gitlab_redis_cache do
    let(:importer) { importer_class.new(project, client) }

    it 'returns false when an object has not yet been imported' 


    it 'returns true when an object has already been imported' 

  end

  describe '#mark_as_imported', :clean_gitlab_redis_cache do
    it 'marks an object as already imported' 

  end
end

