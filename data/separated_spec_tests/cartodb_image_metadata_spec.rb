# coding: UTF-8
require_relative '../simplecov_helper'
require_relative '../../lib/cartodb/image_metadata.rb'
require_relative '../../spec/rspec_configuration.rb'

describe CartoDB::ImageMetadata do
  let(:png_path) { File.expand_path('../../support/data/images/pattern.png', __FILE__) }
  let(:jpg_path) { File.expand_path('../../support/data/images/pattern.jpg', __FILE__) }
  let(:svg_path) { File.expand_path('../../support/data/images/pattern.svg', __FILE__) }
  let(:svg_no_xml_header_path) { File.expand_path('../../support/data/images/svg_without_xml_header', __FILE__) }

  describe '#extract_metadata' do
    let(:metadata) { CartoDB::ImageMetadata.new(png_path) }
    it 'should call parse_identify if magick is installed' 


    it 'should call parse_file if magick is not installed' 

  end

  describe '#parse_file' do
    it 'should extract png dimensions' 


    it 'should not raise error when trying to extract jpg dimensions' 


    it 'should not raise error when trying to extract svg dimensions' 

  end

  describe '#parse_identify' do
    it 'should extract png dimensions' 


    it 'should extract jpg dimensions' 


    it 'should extract svg dimensions' 


    it 'should extract svg dimensions in files without XML header if forced as svg' 

  end
end

