require 'spec_helper'

describe EmailSpec::MailExt do
  describe "#default_part" do
    it "prefers html_part over text_part" 


    it "returns text_part if html_part not available" 


    it "returns the email if not multi-part" 

  end

  describe "#default_part_body" do
    it "returns default_part.body" 


    it "compatible with ActiveSupport::SafeBuffer" 

  end

  describe "#html" do
    it "returns the html part body" 


    it "returns a String" 


    it "returns nil for mail with no html part" 

  end
end

