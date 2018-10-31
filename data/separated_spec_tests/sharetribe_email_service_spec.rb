require 'spec_helper'

def email(h)
  defaults = {confirmed_at: Time.now, send_notifications: true}
  HashClass.new(defaults.merge(h))
end

describe EmailService do
  describe "#emails_to_send_message" do

    it "returns all confirmed notification emails" 


    it "returns first confirmed email if no confirmed notification email is found" 


    it "otherwise returns an empty array" 


  end

  describe "#emails_to_smtp_addresses" do

    it "returns comma-separated list of emails" 


    it "returns only one email (without commas, of course)" 


    it "returns empty string" 


  end

  describe "#can_delete_email" do
    it "can not delete email if email count == 1" 


    it "can not delete email if that's the only CONFIRMED email" 


    it "can not delete email if that's the only notification email" 


    it "can not delete email if that's the only CONFIRMED notification email" 


    it "can not delete email if that's the only email required by community" 


    it "can not delete email if that's the only CONFIRMED email required by community" 

  end
end

