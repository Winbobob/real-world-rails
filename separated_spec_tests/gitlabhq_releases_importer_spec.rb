require 'spec_helper'

describe Gitlab::GithubImport::Importer::ReleasesImporter do
  let(:project) { create(:project) }
  let(:client) { double(:client) }
  let(:importer) { described_class.new(project, client) }
  let(:created_at) { Time.new(2017, 1, 1, 12, 00) }
  let(:updated_at) { Time.new(2017, 1, 1, 12, 15) }

  let(:release) do
    double(
      :release,
      tag_name: '1.0',
      body: 'This is my release',
      created_at: created_at,
      updated_at: updated_at
    )
  end

  describe '#execute' do
    it 'imports the releases in bulk' 

  end

  describe '#build_releases' do
    it 'returns an Array containnig release rows' 


    it 'does not create releases that already exist' 


    it 'uses a default release description if none is provided' 

  end

  describe '#build' do
    let(:release_hash) { importer.build(release) }

    it 'returns the attributes of the release as a Hash' 


    context 'the returned Hash' do
      it 'includes the tag name' 


      it 'includes the release description' 


      it 'includes the project ID' 


      it 'includes the created timestamp' 


      it 'includes the updated timestamp' 

    end
  end

  describe '#each_release' do
    let(:release) { double(:release) }

    before do
      allow(project).to receive(:import_source).and_return('foo/bar')

      allow(client)
        .to receive(:releases)
        .with('foo/bar')
        .and_return([release].to_enum)
    end

    it 'returns an Enumerator' 


    it 'yields every release to the Enumerator' 

  end

  describe '#description_for' do
    it 'returns the description when present' 


    it 'returns a generated description when one is not present' 

  end
end

