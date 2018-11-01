require 'spec_helper'

describe ChunkyPNG::Canvas::Adam7Interlacing do
  include ChunkyPNG::Canvas::Adam7Interlacing

  describe '#adam7_pass_sizes' do
    it "should get the pass sizes for a 8x8 image correctly" 


    it "should get the pass sizes for a 12x12 image correctly" 


    it "should get the pass sizes for a 33x47 image correctly" 


    it "should get the pass sizes for a 1x1 image correctly" 


    it "should get the pass sizes for a 0x0 image correctly" 


    it "should always maintain the same amount of pixels in total" 

  end

  describe '#adam7_multiplier_offset' do
    it "should get the multiplier and offset values for pass 1 correctly" 


    it "should get the multiplier and offset values for pass 2 correctly" 


    it "should get the multiplier and offset values for pass 3 correctly" 


    it "should get the multiplier and offset values for pass 4 correctly" 


    it "should get the multiplier and offset values for pass 5 correctly" 


    it "should get the multiplier and offset values for pass 6 correctly" 


    it "should get the multiplier and offset values for pass 7 correctly" 

  end

  describe '#adam7_merge_pass' do
    it "should merge the submatrices correctly" 

  end

  describe '#adam7_extract_pass' do
    before(:each) { @canvas = reference_canvas('adam7') }

    1.upto(7) do |pass|
      it "should extract pass #{pass} correctly" 

    end
  end

end

