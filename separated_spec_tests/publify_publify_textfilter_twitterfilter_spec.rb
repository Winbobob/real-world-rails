require 'rails_helper'

describe PublifyApp::Textfilter::Twitterfilter do
  def filter_text(text, filters)
    TextFilter.filter_text(text, filters)
  end

  it 'should replace a hashtag with a proper URL to Twitter search' 


  it 'should replace a @mention by a proper URL to the twitter account' 


  it 'should replace a http URL by a proper link' 


  it 'should replace a https URL with a proper link' 


  it 'works with a hashtag and a mention' 

end

