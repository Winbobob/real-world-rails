require 'rails_helper'
require 'plain_text_to_markdown'

describe PlainTextToMarkdown do
  def to_markdown(text, opts = {})
    PlainTextToMarkdown.new(text, opts).to_markdown
  end

  let(:nbsp) { "&nbsp;" }

  context "quotes" do
    it "uses the correct quote level" 


    it "ignores the first whitespace after the quote identifier" 


    it "adds a blank line after a quote if it is followed by text" 


    it "ignores multiple consecutive blank lines" 


    it "adds an additional line with quote identifier if the quote level is decreasing" 


    it "does not add an additional line with quote identifier if the quote level is decreasing and text is blank" 

  end

  context "special characters" do
    it "escapes special Markdown characters" 


    it "escapes special HTML characters" 


    it "escapes special characters but ignores links" 

  end

  context "indentation" do
    it "does not replace one leading whitespace" 


    it "replaces leading whitespaces with non-breaking spaces" 


    it "replaces each leading tabs with two non-breaking spaces" 


    it "correctly replaces leading whitespaces within quotes" 


    it "does not replace whitespaces within text" 

  end

  context "format=flowed" do
    it "concats lines ending with a space" 


    it "does not concat lines when there is an empty line between" 


    it "concats quoted lines ending with a space" 


    it "does not concat quoted lines ending with a space when the quote level differs" 


    it "does not recognize a signature separator as start of flowed text" 


    it "does not concat lines when there is a signature separator" 


    it "removes the trailing space if DelSp is set to 'yes'" 

  end

  context "links" do
    it "removes duplicate links" 


    it "does not removes duplicate links when there is text between the links" 

  end

  context "code" do
    it "detects matching Markdown code block within backticks" 


    it "does not detect Markdown code block when backticks are not on new line" 


    it "does not detect Markdown code block when backticks are indented by more than 3 whitespaces" 

  end
end

