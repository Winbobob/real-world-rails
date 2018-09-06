RSpec.describe Celluloid::Actor::System do
  class TestActor
    include Celluloid
    def identity
      :testing
    end
  end

  after do
    subject.shutdown
  end

  it "supports non-global Actor::System" 


  it "makes actors accessible by Celluloid[:actor]" 


  it "starts default actors" 


  it "support getting threads" 


  it "allows a stack dump" 


  it "allows a stack summary" 


  it "returns named actors" 


  it "returns running actors" 


  it "shuts down" 


  it "warns nicely when no actor system is started" 

end

