require 'spec_helper'

describe ChunkyPNG::Canvas::Masking do

  subject { reference_canvas('clock') }

  before(:all) do
    @theme_color      = ChunkyPNG::Color('#e10f7a')
    @new_color        = ChunkyPNG::Color('#ff0000')
    @background_color = ChunkyPNG::Color('white')
  end

  describe '#change_theme_color!' do
    it "should change the theme color correctly" 

  end

  describe '#extract_mask' do
    it "should create the correct base and mask image" 


    it "should create a mask image with only one opaque color" 

  end

  describe '#change_mask_color!' do
    before { @mask = reference_canvas('clock_mask') }

    it "should replace the mask color correctly" 


    it "should still only have one opaque color" 


    it "should raise an exception when the mask image has more than once color" 

  end
end

