require 'spec_helper'

describe Banzai::Filter::MarkdownFilter do
  include FilterSpecHelper

  describe 'markdown engine from context' do
    it 'defaults to CommonMark' 


    it 'uses Redcarpet' 


    it 'uses CommonMark' 

  end

  describe 'code block' do
    context 'using CommonMark' do
      before do
        stub_const('Banzai::Filter::MarkdownFilter::DEFAULT_ENGINE', :common_mark)
      end

      it 'adds language to lang attribute when specified' 


      it 'does not add language to lang attribute when not specified' 


      it 'works with utf8 chars in language' 

    end

    context 'using Redcarpet' do
      before do
        stub_const('Banzai::Filter::MarkdownFilter::DEFAULT_ENGINE', :redcarpet)
      end

      it 'adds language to lang attribute when specified' 


      it 'does not add language to lang attribute when not specified' 

    end
  end

  describe 'footnotes in tables' do
    it 'processes footnotes in table cells' 

  end
end

