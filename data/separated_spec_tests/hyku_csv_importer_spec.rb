require 'importer'

RSpec.describe Importer::CSVImporter do
  let(:image_directory) { 'spec/fixtures/images' }

  context 'when the model is passed' do
    let(:csv_file) { "#{fixture_path}/csv/gse_metadata.csv" }
    let(:importer) { described_class.new(csv_file, image_directory, fallback_class) }
    let(:fallback_class) { Class.new { def initialize(_x, _y); end } }
    let(:factory) { double(run: true) }

    # note: 2 rows do not specify type, 17 do
    it 'creates new works' 

  end

  context 'when the model specified on the row' do
    let(:csv_file) { "#{fixture_path}/csv/sample.csv" }
    let(:importer) { described_class.new(csv_file, image_directory) }
    let(:collection_factory) { double }
    let(:image_factory) { double }

    it 'creates new images and collections' 

  end
end

