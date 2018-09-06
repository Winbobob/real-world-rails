RSpec.describe Celluloid::RingBuffer do
  subject { Celluloid::RingBuffer.new(2) }

  it { is_expected.to be_empty }
  it { is_expected.not_to be_full }

  it "should push and shift" 


  it "should push past the end" 


  it "should shift the most recent" 


  it "should return nil when shifting empty" 


  it "should be thread-safe" 

end

