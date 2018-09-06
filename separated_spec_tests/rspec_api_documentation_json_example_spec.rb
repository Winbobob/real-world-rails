# -*- coding: utf-8 -*-
require 'spec_helper'
require 'rspec_api_documentation/writers/json_writer'

describe RspecApiDocumentation::Writers::JSONExample do
  let(:configuration) { RspecApiDocumentation::Configuration.new }

  describe "#dirname" do
    it "strips out leading slashes" 


    it "does not strip out non-leading slashes" 

  end

  describe '#filename' do
    specify 'Hello!/ 世界' do |example|
      expect(described_class.new(example, configuration).filename).to eq("hello!_世界.json")
    end
  end
end

