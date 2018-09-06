# coding: utf-8
require 'spec_helper'

describe ChunkyPNG::Datastream do

  describe '.from_io'do
    it "should raise an error when loading a file with a bad signature" 


    it "should raise an error if the CRC of a chunk is incorrect" 


    it "should raise an error for a stream that is too short" 


    it "should read a stream with trailing data without failing" 

  end

  describe '#metadata' do
    it "should load uncompressed tXTt chunks correctly" 


    it "should load compressed zTXt chunks correctly" 


    it "ignores iTXt chunks" 

  end

  describe '#physical_chunk' do
    it 'should read and write pHYs chunks correctly' 


    it 'should raise ChunkyPNG::UnitsUnknown if we request dpi but the units are unknown' 

  end

  describe '#iTXt_chunk' do
    it 'should read iTXt chunks correctly' 


    it 'should write iTXt chunks correctly' 


    it 'should handle incorrect UTF-8 encoding in iTXt chunks' 


    it 'should handle UTF-8 in iTXt compressed chunks correctly' 


    it 'should handle UTF-8 in iTXt chunks correctly' 


    it 'should transform non UTF-8 iTXt fields to UTF-8 on write' 

  end
end

