require "spec_helper"

# Inspired in great part by Discourse's Email::Receiver
describe Gitlab::Email::ReplyParser do
  describe '#execute' do
    def test_parse_body(mail_string, params = {})
      described_class.new(Mail::Message.new(mail_string), params).execute
    end

    it "returns an empty string if the message is blank" 


    it "returns an empty string if the message is not an email" 


    it "returns an empty string if there is no reply content" 


    it "properly renders plaintext-only email" 


    it "supports a Dutch reply" 


    it "removes an 'on date wrote' quoting line" 


    it "handles multiple paragraphs" 


    it "handles multiple paragraphs when parsing html" 


    it "handles newlines" 


    it "handles inline reply" 


    it "properly renders email reply from gmail web client" 


    it "properly renders email reply from iOS default mail client" 


    it "properly renders email reply from Android 5 gmail client" 


    it "properly renders email reply from Windows 8.1 Metro default mail client" 


    it "properly renders email reply from MS Outlook client" 


    it "properly renders html-only email from MS Outlook" 


    it "does not wrap links with no href in unnecessary brackets" 


    it "does not trim reply if trim_reply option is false" 

  end
end

