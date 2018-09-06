describe Vmdb::Loggers::AzureLogger do
  before do
    @log_stream = StringIO.new
    @log = described_class.new(@log_stream)
  end

  context "azure" do
    it "filters out bearer tokens" 


    it "filters out sharedkey tokens" 


    it "filters out client secret tokens" 

  end
end

