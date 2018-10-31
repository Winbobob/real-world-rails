require "rails_helper"
require "import_export/category_exporter"
require "import_export/category_structure_exporter"
require "import_export/importer"

describe ImportExport::Importer do

  before do
    STDOUT.stubs(:write)
  end

  let(:import_data) do
    import_file = Rack::Test::UploadedFile.new(file_from_fixtures("import-export.json", "json"))
    data = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(import_file.read))
  end

  def import(data)
    ImportExport::Importer.new(data).perform
  end

  context '.perform' do

    it 'topics and users' 


    it 'categories and groups' 


    it 'categories, groups and users' 


    it 'all' 


  end

end

