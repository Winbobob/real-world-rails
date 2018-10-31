require 'spec_helper'

describe XPath::Union do
  let(:template) { File.read(File.expand_path('fixtures/simple.html', File.dirname(__FILE__))) }
  let(:doc) { Nokogiri::HTML(template) }

  describe '#expressions' do
    it "should return the expressions" 

  end

  describe '#each' do
    it "should iterate through the expressions" 

  end

  describe '#map' do
    it "should map the expressions" 

  end

  describe '#to_xpath' do
    it "should create a valid xpath expression" 

  end


  describe '#where and others' do
    it "should be delegated to the individual expressions" 

  end

end


