require 'spec_helper'

describe ChunkyPNG::Vector do
  subject { ChunkyPNG::Vector.new([ChunkyPNG::Point.new(2, 5), ChunkyPNG::Point.new(1, 3), ChunkyPNG::Point.new(4, 6)]) }

  it { should respond_to(:points) }

  describe '#length' do
    it "shopuld have 3 items" 

  end

  describe '#x_range' do
    it "should get the right range of x values" 


    it "should find the minimum x-coordinate" 


    it "should find the maximum x-coordinate" 


    it "should calculate the width correctly" 

  end

  describe '#y_range' do
    it "should get the right range of y values" 


    it "should find the minimum x-coordinate" 


    it "should find the maximum x-coordinate" 


    it "should calculate the height correctly" 

  end

  describe '#offset' do
    it "should return a ChunkyPNG::Point" 


    it "should use the mininum x and y coordinates as values for the point" 

  end

  describe '#dimension' do
    it "should return a ChunkyPNG::Dimension" 


    it "should use the width and height of the vector for the dimension" 

  end

  describe '#edges' do
    it "should get three edges when closing the path" 


    it "should get two edges when not closing the path" 

  end
end

describe 'ChunkyPNG.Vector' do
  let(:example) { ChunkyPNG::Vector.new([ChunkyPNG::Point.new(2, 4), ChunkyPNG::Point.new(1, 2), ChunkyPNG::Point.new(3, 6)]) }

  it "should return an empty vector when given an empty array" 


  it "should raise an error when an odd number of numerics is given" 


  it "should create a vector from a string" 


  it "should create a vector from a flat array" 


  it "should create a vector from a nested array" 

end

