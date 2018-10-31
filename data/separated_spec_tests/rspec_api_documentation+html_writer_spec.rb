# -*- coding: utf-8 -*-
require 'spec_helper'

describe RspecApiDocumentation::Writers::HtmlWriter do
  let(:index) { RspecApiDocumentation::Index.new }
  let(:configuration) { RspecApiDocumentation::Configuration.new }

  describe ".write" do
    let(:writer) { double(:writer) }

    it "should build a new writer and write the docs" 

  end

  describe "#write" do
    let(:writer) { described_class.new(index, configuration) }

    it "should write the index" 

  end
end


