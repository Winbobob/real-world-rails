require 'rails_helper'

RSpec.describe AutoLinkHelper, type: :helper do
  describe "#auto_link" do
    it "auto links urls embedded in a text block" 


    it "doesn't auto link urls inside tag attributes" 


    it "auto links urls with parentheses" 


    it "auto links urls with brackets" 


    it "auto links urls with braces" 


    it "accepts options" 


    it "handles multiple trailing punctuations" 


    it "accepts a block" 


    it "accepts a block that returns HTML" 


    it "sanitizes input when sanitize option is not false" 


    it "sanitizes input with the sanitize_options" 


    it "doesn't sanitize input when sanitize option is false" 


    it "auto links other protocols" 


    it "doesn't auto link already linked urls" 


    it "doesn't auto link already linked urls when sanitize is false" 


    it "doesn't auto link already linked urls when using sanitize_options" 


    it "doesn't auto link already linked mailto: urls" 


    it "handles malicious attributes" 


    it "auto links urls at the end of the line" 


    it "is marked as HTML safe" 


    it "is not marked as HTML safe when sanitize is false" 


    it "auto links email addresses" 


    it "auto links email addresses with special chars" 


    it "parses urls correctly" 


    it "handles trailing equals on links" 


    it "handles trailing ampersands on links" 


    it "doesn't timeout when parsing odd email input" 

  end
end

