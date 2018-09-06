# -*- encoding : utf-8 -*-

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe 'highlighting search results' do
  include HighlightHelper

  before do
    get_fixtures_xapian_index
  end

  it 'ignores stopwords' 


  it 'ignores case' 


  it 'highlights stemmed words' 


  it 'highlights stemmed words even if the stem is unhelpful' 


  it 'handles macrons correctly' 


end

