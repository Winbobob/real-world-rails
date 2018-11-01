# frozen_string_literal: true

describe Diaspora::MessageRenderer do
  def message(text, opts={})
    Diaspora::MessageRenderer.new(text, opts)
  end

  describe '#title' do
    context 'when :length is passed in parameters' do
      it 'returns string of size less or equal to :length' 

    end

    context 'when :length is not passed in parameters' do
      context 'with a Markdown header of less than 200 characters on first line' do
        it 'returns atx style header' 


        it 'returns setext style header' 


        it 'returns header without markdown' 

      end

      context "without a Markdown header of less than 200 characters on first line" do
        it "truncates posts to the 70 first characters" 

      end
    end
  end

  describe '#html' do
    it 'escapes the message' 


    it 'is html_safe' 


    it 'should leave HTML entities intact' 


    it 'normalizes' 


    context 'with mentions' do
      it 'makes hovercard links for mentioned people' 


      it 'makes plaintext out of mentions of people not in the posts aspects' 


      context 'linking all mentions' do
        it 'makes plain links for people not in the post aspects' 


        it "makes no hovercards if they're disabled" 

      end
    end

    context "with diaspora:// links" do
      it "replaces diaspora:// links with pod-local links" 


      it "doesn't touch invalid diaspora:// links" 


      it "ignores a diaspora:// links with a unknown guid" 


      it "ignores a diaspora:// links with an invalid entity type" 

    end
  end

  describe "#markdownified" do
    describe "not doing something dumb" do
      it "strips out script tags" 


      it 'strips onClick handlers from links' 

    end

    it 'does not barf if message is nil' 


    it 'autolinks standard url links' 


    it "normalizes" 


    context 'when formatting status messages' do
      it "should leave tags intact" 


      it 'should leave multi-underscore tags intact' 


      it "should leave mentions intact" 


      it "should leave mentions intact for real diaspora handles" 


      it 'should process text with both a hashtag and a link' 


      it 'should process text with a header' 


      it 'should leave HTML entities intact' 


      context "with diaspora:// links" do
        it "replaces diaspora:// links with pod-local links" 


        it "doesn't touch invalid diaspora:// links" 

      end
    end
  end

  describe "#plain_text_without_markdown" do
    it 'does not remove markdown in links' 


    it 'does not destroy hashtag that starts a line' 


    context "with mention" do
      it "contains the name of the mentioned person" 


      it "uses the name from mention when the mention contains a name" 


      it "uses the diaspora ID when the person cannot be found" 

    end

    context "with diaspora:// links" do
      it "replaces diaspora:// links with pod-local links" 


      it "doesn't touch invalid diaspora:// links" 

    end
  end

  describe "#urls" do
    it "extracts the urls from the raw message" 


    it "extracts urls from continous markdown correctly" 


    it "encodes extracted urls" 


    it "not double encodes an already encoded url" 


    it "parses IDN correctly" 

  end

  describe "#plain_text_for_json" do
    it "normalizes" 


    context "with diaspora:// links" do
      it "replaces diaspora:// links with pod-local links" 


      it "doesn't touch invalid diaspora:// links" 

    end
  end
end

