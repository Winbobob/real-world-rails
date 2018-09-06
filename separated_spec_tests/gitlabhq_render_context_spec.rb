# frozen_string_literal: true

require 'spec_helper'

describe Banzai::RenderContext do
  let(:document) { Nokogiri::HTML.fragment('<p>hello</p>') }

  describe '#project_for_node' do
    it 'returns the default project if no associated project was found' 


    it 'returns the associated project if one was associated explicitly' 


    it 'returns the project associated with a DocumentFragment when using a node' 

  end
end

