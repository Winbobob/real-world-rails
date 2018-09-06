require 'spec_helper'

describe ChunkyPNG::Canvas::PNGDecoding do
  include ChunkyPNG::Canvas::PNGDecoding

  describe '#decode_png_scanline' do

    it "should decode a line without filtering as is" 


    it "should decode a line with sub filtering correctly" 


    it "should decode a line with up filtering correctly" 


    it "should decode a line with average filtering correctly" 


    it "should decode a line with paeth filtering correctly" 

  end

  describe '#decode_png_extract_4bit_value' do
    it "should extract the high bits successfully" 


    it "should extract the low bits successfully" 

  end

  describe '#decode_png_extract_2bit_value' do
    it "should extract the first 2 bits successfully" 


    it "should extract the second 2 bits successfully" 


    it "should extract the third 2 bits successfully" 


    it "should extract the low two bits successfully" 

  end

  describe '#decode_png_extract_1bit_value' do
    it "should extract all separate bits correctly" 

  end
end

