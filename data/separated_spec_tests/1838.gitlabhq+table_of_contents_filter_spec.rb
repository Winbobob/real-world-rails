require 'spec_helper'

describe Banzai::Filter::TableOfContentsFilter do
  include FilterSpecHelper

  def header(level, text)
    "<h#{level}>#{text}</h#{level}>\n"
  end

  it 'does nothing when :no_header_anchors is truthy' 


  it 'does nothing with empty headers' 


  1.upto(6) do |i|
    it "processes h#{i} elements" 

  end

  describe 'anchor tag' do
    it 'has an `anchor` class' 


    it 'has a namespaced id' 


    it 'links to the non-namespaced id' 


    describe 'generated IDs' do
      it 'translates spaces to dashes' 


      it 'squeezes multiple spaces and dashes' 


      it 'removes punctuation' 


      it 'appends a unique number to duplicates' 


      it 'prepends a prefix to digits-only ids' 


      it 'supports Unicode' 

    end
  end

  describe 'result' do
    def result(html)
      HTML::Pipeline.new([described_class]).call(html)
    end

    let(:results) { result(header(1, 'Header 1') + header(2, 'Header 2')) }
    let(:doc) { Nokogiri::XML::DocumentFragment.parse(results[:toc]) }

    it 'is contained within a `ul` element' 


    it 'contains an `li` element for each header' 


    context 'table of contents nesting' do
      let(:results) do
        result(
          header(1, 'Header 1') <<
          header(2, 'Header 1-1') <<
          header(3, 'Header 1-1-1') <<
          header(2, 'Header 1-2') <<
          header(1, 'Header 2') <<
          header(2, 'Header 2-1')
        )
      end

      it 'keeps list levels regarding header levels' 

    end

    context 'header text contains escaped content' do
      let(:content) { '&lt;img src="x" onerror="alert(42)"&gt;' }
      let(:results) { result(header(1, content)) }

      it 'outputs escaped content' 

    end
  end
end

