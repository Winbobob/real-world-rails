require 'feed_element_installer'
require 'rails_helper'

describe FeedElementInstaller do
  describe '#install_rss_element' do
    let(:raw_feed) { file_from_fixtures('feed.rss', 'feed').read }

    it 'creates parsing for a non-standard, namespaced element' 


    it 'does not create parsing for a non-standard, non-namespaced element' 

  end

  describe '#install_atom_element' do
    let(:raw_feed) { file_from_fixtures('feed.atom', 'feed').read }

    it 'creates parsing for a non-standard, namespaced element' 


    it 'does not create parsing for a non-standard, non-namespaced element' 

  end
end

