require 'rails_helper'
require 'text_cleaner'

describe TextCleaner do

  context "exclamation marks" do

    let(:duplicated_string) { "my precious!!!!" }
    let(:deduplicated_string) { "my precious!" }

    it "ignores multiple ! by default" 


    it "deduplicates ! when enabled" 


  end

  context "question marks" do

    let(:duplicated_string) { "please help me????" }
    let(:deduplicated_string) { "please help me?" }

    it "ignores multiple ? by default" 


    it "deduplicates ? when enabled" 


  end

  context "all upper case text" do

    let(:all_caps) { "ENTIRE TEXT IS ALL CAPS" }
    let(:almost_all_caps) { "ENTIRE TEXT iS ALL CAPS" }
    let(:regular_case) { "entire text is all caps" }

    it "ignores all upper case text by default" 


    it "replaces all upper case text with regular case letters when enabled" 


    it "ignores almost all upper case text when enabled" 


  end

  context "first letter" do

    let(:lowercased) { "this is awesome" }
    let(:capitalized) { "This is awesome" }
    let(:iletter) { "iLetter" }

    it "ignores first letter case by default" 


    it "capitalizes first letter when enabled" 


  end

  context "periods at the end" do

    let(:with_one_period) { "oops." }
    let(:with_several_periods) { "oops..." }
    let(:without_period) { "oops" }

    it "ignores unnecessary periods at the end by default" 


    it "removes unnecessary periods at the end when enabled" 


    it "keeps trailing whitespaces when enabled" 


  end

  context "extraneous space" do

    let(:with_space_exclamation) { "oops !" }
    let(:without_space_exclamation) { "oops!" }
    let(:with_space_question) { "oops ?" }
    let(:without_space_question) { "oops?" }

    it "ignores extraneous space before the end punctuation by default" 


    it "removes extraneous space before the end punctuation when enabled" 


    it "keep trailing whitespaces when enabled" 


  end

  context "interior spaces" do

    let(:spacey_string) { "hello     there's weird     spaces here." }
    let(:unspacey_string) { "hello there's weird spaces here." }

    it "ignores interior spaces by default" 


    it "fixes interior spaces when enabled" 


  end

  context "leading and trailing whitespaces" do

    let(:spacey_string) { "   \t  test \n  " }
    let(:unspacey_string) { "test" }

    it "ignores leading and trailing whitespaces by default" 


    it "strips leading and trailing whitespaces when enabled" 


  end

  context "title" do

    it "fixes interior spaces" 


    it "strips leading and trailing whitespaces" 


    it "strips zero width spaces" 


    context "title_prettify site setting is enabled" do

      before { SiteSetting.title_prettify = true }

      it "deduplicates !" 


      it "deduplicates ?" 


      it "replaces all upper case text with regular case letters" 


      it "capitalizes first letter" 


      it "removes unnecessary period at the end" 


      it "removes extraneous space before the end punctuation" 


      it "replaces all upper case unicode text with regular unicode case letters" 


      it "doesn't downcase text if only one word is upcase in a non-ascii alphabet" 


      it "capitalizes first unicode letter" 


    end

  end

  describe "#normalize_whitespaces" do
    it "normalize whitespaces" 


    it "does not muck with zero width white space" 

  end

end

