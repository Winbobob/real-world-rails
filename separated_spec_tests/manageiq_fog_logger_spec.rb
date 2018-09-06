describe Vmdb::Loggers::FogLogger do
  before do
    @log_stream = StringIO.new
    @log = described_class.new(@log_stream)
    @log.level = VMDBLogger::DEBUG
  end

  context ".instrument" do
    it "with no block" 


    it "with a block" 

  end
end

