require 'spec_helper'

describe ChunkyPNG::Dimension do
  subject { ChunkyPNG::Dimension.new(2, 3) }

  it { should respond_to(:width) }
  it { should respond_to(:height) }

  describe '#area' do
    it "should calculate the area correctly" 

  end
end

describe 'ChunkyPNG.Dimension' do
  subject { ChunkyPNG::Dimension.new(1, 2) }

  it "should create a dimension from a 2-item array" 


  it "should create a dimension from a hash with x and y keys" 


  it "should create a dimension from a point-like string" 


  it "should create a dimension from an object that responds to width and height" 


  it "should raise an exception if the input is not understood" 

end

