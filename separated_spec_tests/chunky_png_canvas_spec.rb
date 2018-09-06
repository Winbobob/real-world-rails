require 'spec_helper'

describe ChunkyPNG::Canvas do

  subject { ChunkyPNG::Canvas.new(1, 1, ChunkyPNG::Color::WHITE) }

  it { should respond_to(:width) }
  it { should respond_to(:height) }
  it { should respond_to(:pixels) }

  describe '#initialize' do
    it "should accept a single color value as background color" 


    it "should raise an error if the color value is not understood" 


    it "should accept an array as initial pixel values" 


    it "should raise an ArgumentError if the initial array does not have the correct number of elements" 


    it "should use a transparent background by default" 

  end

  describe '#dimension' do
    it "should return the dimensions as a Dimension instance" 

  end

  describe '#area' do
    it "should return the dimensions as two-item array" 

  end

  describe '#include?' do
    it "should return true if the coordinates are within bounds, false otherwise" 


    it "should accept strings, arrays, hashes and points as well" 

  end

  describe '#include_x?' do
    it "should return true if the x-coordinate is within bounds, false otherwise" 

  end

  describe '#include_y?' do
    it "should return true if the y-coordinate is within bounds, false otherwise" 

  end

  describe '#assert_xy!' do
    it "should not raise an exception if the coordinates are within bounds" 


    it "should raise an exception if the coordinates are out of bounds bounds" 

  end

  describe '#assert_x!' do
    it "should not raise an exception if the x-coordinate is within bounds" 


    it "should raise an exception if the x-coordinate is out of bounds bounds" 

  end

  describe '#[]' do
    it "should return the pixel value if the coordinates are within bounds" 


    it "should assert the coordinates to be within bounds" 

  end

  describe '#get_pixel' do
    it "should return the pixel value if the coordinates are within bounds" 


    it "should not assert nor check the coordinates" 

  end

  describe '#[]=' do
    it "should change the pixel's color value" 


    it "should assert the bounds of the image" 

  end

  describe 'set_pixel' do
    it "should change the pixel's color value" 


    it "should not assert or check the bounds of the image" 

  end

  describe '#set_pixel_if_within_bounds' do
    it "should change the pixel's color value" 


    it "should not assert, but only check the coordinates" 


    it "should do nothing if the coordinates are out of bounds" 

  end

  describe '#row' do
    before { @canvas = reference_canvas('operations') }

    it "should give an out of bounds exception when y-coordinate is out of bounds" 


    it "should return the correct pixels" 

  end

  describe '#column' do
    before { @canvas = reference_canvas('operations') }

    it "should give an out of bounds exception when x-coordinate is out of bounds" 


    it "should return the correct pixels" 

  end

  describe '#replace_canvas' do
    it "should change the dimension of the canvas" 


    it "should change the pixel array" 


    it "should return itself" 

  end
end

