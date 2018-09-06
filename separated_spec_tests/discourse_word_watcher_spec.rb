require 'rails_helper'

describe WordWatcher do

  let(:raw) { "Do you like liquorice?\n\nI really like them. One could even say that I am *addicted* to liquorice. Anf if\nyou can mix it up with some anise, then I'm in heaven ;)" }

  after do
    $redis.flushall
  end

  describe "word_matches_for_action?" do
    it "is falsey when there are no watched words" 


    context "with watched words" do
      let!(:anise) { Fabricate(:watched_word, word: "anise", action: WatchedWord.actions[:require_approval]) }

      it "is falsey without a match" 


      it "is returns matched words if there's a match" 


      it "finds at start of string" 


      it "finds at end of string" 


      it "finds non-letters in place of letters" 


      it "handles * for wildcards" 


      context "regular expressions" do
        before do
          SiteSetting.watched_words_regular_expressions = true
        end

        it "supports regular expressions on word boundaries" 


        it "supports regular expressions as a site setting" 


        it "support uppercase" 

      end

    end
  end

end

