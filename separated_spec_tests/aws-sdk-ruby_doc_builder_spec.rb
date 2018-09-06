require_relative '../../spec_helper'
require 'ostruct'

module Aws
  module Xml
    describe DocBuilder do

      let(:result) { '' }

      let(:options) { { target: result, indent: '' } }

      let(:xml) { DocBuilder.new(options) }

      it 'creates empty xml documents' 


      it 'nests elements' 


      it 'nests elements deeply' 


      it 'supports flat elements with nested elements' 


      it 'accepts element values' 


      it 'accepts element attributes' 


      it 'accepts element values and attributes at the same time' 


      it 'accepts attributes on outer elements' 


      it 'escapes attribute values and element text' 


      it 'accepts :indent and initial :pad options' 


      it 'can build xml to any object that responds to #<<' 


    end
  end
end

