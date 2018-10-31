require 'spec_helper'

describe ArticlesHelper do

  context 'link_to_tags helper method' do

    it 'generates a hyperlink to the filtered articles index page' 


    it 'generates a comma separated link of tag links with multiple tags' 

  end

  context 'rendering markdown' do

    it 'should correctly render markdown tags' 


    it 'should render an empty string when the input is nil' 


    it 'should render "Failed to render markdown" when it CodeRay fails for whatever reason' 


    it 'should render block code correctly' 


    it 'should render block code without a language specified correctly' 


    context 'preview' do
      it 'should render a truncated markdown text' 


      it 'should not show links or image tags' 


      it 'should render an empty string when the input is nil' 

    end
  end
end

