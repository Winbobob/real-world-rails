# frozen_string_literal: true
# based on http://stackoverflow.com/a/20010923/2187922

require 'spec_helper'

shared_examples_for 'linkable' do
  let(:model) { described_class } # the class that includes the concern

  context 'with no parameter' do
    it 'generates a markdown link with name as text when object exists' 


    it "simply returns the name when object doesn't exist" 

  end

  context 'when text is passed' do
    it 'generates a markdown link with custom text when object exists' 


    it "simply returns the name when object doesn't exist" 

  end
end

