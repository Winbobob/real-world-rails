require 'rails_helper'

describe SearchIndexer do
  let(:post_id) { 99 }

  def scrub(html, strip_diacritics: false)
    SearchIndexer.scrub_html_for_search(html, strip_diacritics: strip_diacritics)
  end

  it 'correctly indexes chinese' 


  it 'extract youtube title' 


  it 'extract a link' 


  it 'uses ignore_accent setting to strip diacritics' 


  it "doesn't index local files" 


  it 'correctly indexes a post according to version' 

end

