describe Vmdb::Loggers::MulticastLogger do
  let(:logger1) { Logger.new(StringIO.new) }
  let(:logger2) { Logger.new(StringIO.new) }
  subject { described_class.new(logger1, logger2) }

  context "#add" do
    it "forwards to the other loggers" 


    it "only forwards the message if the severity is correct" 

  end

  it "#level= updates the log level on all backing devices" 


  context "#<<" do
    it "forwards to the other loggers" 


    it "returns the size of the logged message" 

  end
end

