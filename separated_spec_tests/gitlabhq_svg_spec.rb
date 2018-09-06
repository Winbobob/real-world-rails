require 'spec_helper'

describe Gitlab::Sanitizers::SVG do
  let(:scrubber) { Gitlab::Sanitizers::SVG::Scrubber.new }
  let(:namespace) { double(Nokogiri::XML::Namespace, prefix: 'xlink', href: 'http://www.w3.org/1999/xlink') }
  let(:namespaced_attr) { double(Nokogiri::XML::Attr, name: 'href', namespace: namespace, value: '#awesome_id') }

  describe '.clean' do
    let(:input_svg_path) { File.join(Rails.root, 'spec', 'fixtures', 'unsanitized.svg') }
    let(:data) { open(input_svg_path).read }
    let(:sanitized_svg_path) { File.join(Rails.root, 'spec', 'fixtures', 'sanitized.svg') }
    let(:sanitized) { open(sanitized_svg_path).read }

    it 'delegates sanitization to scrubber' 


    it 'returns sanitized data' 

  end

  context 'scrubber' do
    describe '#scrub' do
      let(:invalid_element) { double(Nokogiri::XML::Node, name: 'invalid', value: 'invalid') }
      let(:invalid_attribute) { double(Nokogiri::XML::Attr, name: 'invalid', namespace: nil) }
      let(:valid_element) { double(Nokogiri::XML::Node, name: 'use') }

      it 'removes an invalid element' 


      it 'removes an invalid attribute' 


      it 'accepts valid element' 


      it 'accepts valid namespaced attributes' 

    end

    describe '#attribute_name_with_namespace' do
      it 'returns name with prefix when attribute is namespaced' 

    end

    describe '#unsafe_href?' do
      let(:unsafe_attr) { double(Nokogiri::XML::Attr, name: 'href', namespace: namespace, value: 'http://evilsite.example.com/random.svg') }

      it 'returns true if href attribute is an external url' 


      it 'returns false if href atttribute is an internal reference' 

    end

    describe '#data_attribute?' do
      let(:data_attr) { double(Nokogiri::XML::Attr, name: 'data-gitlab', namespace: nil, value: 'gitlab is awesome') }
      let(:namespaced_attr) { double(Nokogiri::XML::Attr, name: 'data-gitlab', namespace: namespace, value: 'gitlab is awesome') }
      let(:other_attr) { double(Nokogiri::XML::Attr, name: 'something', namespace: nil, value: 'content') }

      it 'returns true if is a valid data attribute' 


      it 'returns false if attribute is namespaced' 


      it 'returns false if not a data attribute' 

    end
  end
end

