require 'spec_helper'

describe ChunkyPNG::Point do

  subject { ChunkyPNG::Point.new(1, 2) }

  it { should respond_to(:x) }
  it { should respond_to(:y) }

  describe '#within_bounds?' do
    it { should     be_within_bounds(2, 3)  }
    it { should_not be_within_bounds('1x3') }
    it { should_not be_within_bounds(2, 2) }
    it { should_not be_within_bounds('[1 2]') }
  end

  describe '#<=>' do
    it "should return 0 if the coordinates are identical" 


    it "should return -1 if the y coordinate is smaller than the other one" 


    it "should return 1 if the y coordinate is larger than the other one" 


    it "should return -1 if the x coordinate is smaller and y is the same" 


    it "should return 1 if the x coordinate is larger and y is the same" 

  end
end

describe 'ChunkyPNG.Point' do
  subject { ChunkyPNG::Point.new(1, 2) }


  it "should create a point from a 2-item array" 


  it "should create a point from a hash with x and y keys" 


  it "should create a point from a ChunkyPNG::Dimension object" 


  it "should create a point from a point-like string" 


  it "should create a point from an object that responds to x and y" 


  it "should raise an exception if the input is not understood" 

end

