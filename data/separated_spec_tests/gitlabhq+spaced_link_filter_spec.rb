require 'spec_helper'

describe Banzai::Filter::SpacedLinkFilter do
  include FilterSpecHelper

  let(:link)  { '[example](page slug)' }
  let(:image) { '![example](img test.jpg)' }

  context 'when a link is detected' do
    it 'converts slug with spaces to a link' 


    it 'converts slug with spaces and a title to a link' 


    it 'does nothing when markdown_engine is redcarpet' 


    it 'does nothing with empty text' 


    it 'does nothing with an empty slug' 

  end

  context 'when an image is detected' do
    it 'converts slug with spaces to an iamge' 


    it 'converts slug with spaces and a title to an image' 

  end

  it 'converts multiple URLs' 


  described_class::IGNORE_PARENTS.each do |elem|
    it "ignores valid links contained inside '#{elem}' element" 

  end
end

