require 'importer'
require 'importer/mods_parser'

RSpec.describe Importer::ModsImporter, :clean do
  let(:image_directory) { 'spec/fixtures/images' }
  let(:importer) { described_class.new(image_directory) }
  let(:actor) { double }

  before do
    allow(Hyrax::CurationConcern).to receive(:actor).and_return(actor)
  end

  describe '#import an image' do
    let(:file) { 'spec/fixtures/mods/shpc/druid_xv169dn4538.mods' }

    it 'creates a new image and a collection' 


    context 'when the collection already exists' do
      let!(:coll) { create(:collection, id: 'kx532cb7981', title: ['Test Collection']) }

      it 'adds image to existing collection' 

    end
  end

  describe '#import a Collection' do
    let(:file) { 'spec/fixtures/mods/shpc/kx532cb7981.mods' }

    it 'creates a collection' 


    context 'when the collection already exists' do
      let!(:existing) { FactoryBot.create(:collection, id: 'kx532cb7981', title: ['Test Collection']) }

      it 'adds metadata to existing collection' 

    end
  end
end

