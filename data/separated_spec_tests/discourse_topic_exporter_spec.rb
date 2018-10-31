require "rails_helper"
require "import_export/topic_exporter"

describe ImportExport::TopicExporter do

  before do
    STDOUT.stubs(:write)
  end

  let(:user) { Fabricate(:user) }
  let(:topic) { Fabricate(:topic, user: user) }
  let!(:post) { Fabricate(:post, topic: topic, user: user) }

  context '.perform' do
    it 'export a single topic' 


    it 'export multiple topics' 

  end

end

