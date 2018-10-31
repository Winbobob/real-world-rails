require "rails_helper"
require "import_export/category_exporter"

describe ImportExport::CategoryExporter do

  let(:category) { Fabricate(:category) }
  let(:group) { Fabricate(:group) }
  let(:user) { Fabricate(:user) }
  let(:user2) { Fabricate(:user) }
  let(:user3) { Fabricate(:user) }

  before do
    STDOUT.stubs(:write)
  end

  context '.perform' do
    it 'export the category when it is found' 


    it 'export the category with permission groups' 


    it 'export multiple categories' 


    it 'export the category with topics and users' 

  end

end

