# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActsAsXapian::Search do

  describe "#words_to_highlight" do

    before :all do
      get_fixtures_xapian_index
      # make sure an index exists
      @alice = FactoryGirl.create(:public_body, :name => 'alice')
      update_xapian_index
    end

    after :all do
      @alice.destroy
      update_xapian_index
    end

    it "should return a list of words used in the search" 


    it "should remove any operators" 


    it "should separate punctuation" 


    it "should handle non-ascii characters" 


    it "should ignore stopwords" 


    it "uses stemming" 


    it "doesn't stem proper nouns" 


    it "includes the original search terms if requested" 


    it "does not return duplicate terms" 


    context 'the :regex option' do

      it 'wraps each words in a regex that matches the full word' 


      it 'wraps each stem in a regex' 


    end
  end

  describe '#spelling_correction' do

    before :all do
      load_raw_emails_data
      get_fixtures_xapian_index
      @alice = FactoryGirl.create(:public_body, :name => 'alice')
      @bob = FactoryGirl.create(:public_body, :name => 'bôbby')
      update_xapian_index
    end

    after :all do
      @alice.destroy
      @bob.destroy
      update_xapian_index
    end

    it 'returns a UTF-8 encoded string' 


    it 'handles non-ASCII characters' 


  end

end

