# frozen_string_literal: true

require 'rails_helper'

describe PublifyApp::Textfilter::Twitterfilter do
  def filter_text(text, filters)
    TextFilter.filter_text(text, filters)
  end

  it 'replaces a hashtag with a proper URL to Twitter search' 


  it 'replaces a @mention by a proper URL to the twitter account' 


  it 'replaces a http URL by a proper link' 


  it 'replaces a https URL with a proper link' 


  it 'works with a hashtag and a mention' 

end

