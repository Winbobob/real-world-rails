# -*- coding: utf-8 -*-
require 'spec_helper'

describe RspecApiDocumentation::Writers::SlateWriter do
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

  context 'instance methods' do
    let(:writer) { described_class.new(index, configuration) }

    describe '#markup_example_class' do
      subject { writer.markup_example_class }
      it { is_expected.to be == RspecApiDocumentation::Views::SlateExample }
    end
  end
end

