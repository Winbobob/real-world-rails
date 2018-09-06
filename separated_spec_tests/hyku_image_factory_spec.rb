require 'importer'

RSpec.describe Importer::Factory::ImageFactory, :clean do
  let(:factory) { described_class.new(attributes) }
  let(:actor) { double }
  before do
    allow(Hyrax::CurationConcern).to receive(:actor).and_return(actor)
  end
  let(:files) { [] }
  let(:attributes) do
    {
      collection: { id: coll.id },
      files: files,
      identifier: ['123'],
      title: ['Test image'],
      read_groups: ['public'],
      depositor: 'bob',
      edit_users: ['bob']
    }
  end

  context 'with files' do
    let(:factory) { described_class.new(attributes, 'tmp/files', files) }
    let(:files) { ['img.png'] }
    let!(:coll) { create(:collection) }

    context "for a new image" do
      it 'creates file sets with access controls' 

    end

    context "for an existing image without files" do
      let(:work) { create(:generic_work) }
      let(:factory) { described_class.new(attributes.merge(id: work.id), 'tmp/files', files) }

      it 'creates file sets' 

    end
  end

  context 'when a collection already exists' do
    let!(:coll) { create(:collection) }

    it 'does not create a new collection' 

  end
end

