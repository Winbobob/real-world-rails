require 'spec_helper'

describe Gitlab::GithubImport::Importer::LfsObjectsImporter do
  let(:project) { double(:project, id: 4, import_source: 'foo/bar') }
  let(:client) { double(:client) }
  let(:download_link) { "http://www.gitlab.com/lfs_objects/oid" }

  let(:github_lfs_object) { ['oid', download_link] }

  describe '#parallel?' do
    it 'returns true when running in parallel mode' 


    it 'returns false when running in sequential mode' 

  end

  describe '#execute' do
    context 'when running in parallel mode' do
      it 'imports lfs objects in parallel' 

    end

    context 'when running in sequential mode' do
      it 'imports lfs objects in sequence' 

    end
  end

  describe '#sequential_import' do
    it 'imports each lfs object in sequence' 

  end

  describe '#parallel_import' do
    it 'imports each lfs object in parallel' 

  end

  describe '#collection_options' do
    it 'returns an empty Hash' 

  end
end

