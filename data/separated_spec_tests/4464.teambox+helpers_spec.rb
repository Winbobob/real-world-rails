require File.dirname(__FILE__) + '/../spec_helper'

describe EmailSpec::Helpers do
  include EmailSpec::Helpers
  describe "#parse_email_for_link" do
    it "properly finds links with text" 


    it "recognizes img alt properties as text" 


    it "causes a spec to fail if the body doesn't contain the text specified to click" 

  end

  describe "#set_current_email" do
    it "should cope with a nil email" 


    it "should cope with a real email" 


    shared_examples_for 'something that sets the current email for recipients' do
      before do
        @email = Mail.new(@recipient_type => 'dave@example.com')
      end

      it "should record that the email has been read for that recipient" 


      it "should record that the email has been read for all the recipient of that type" 


      it "should record that the email is the current email for the recipient" 


      it "should record that the email is the current email for all the recipients of that type" 


      it "should overwrite current email for the recipient with this one" 


      it "should overwrite the current email for all the recipients of that type" 


      it "should not complain when the email has recipients of that type" 

    end

    describe 'for mails with recipients in the to address' do
      before do
        @recipient_type = :to
      end

      it_should_behave_like 'something that sets the current email for recipients'
    end

    describe 'for mails with recipients in the cc address' do
      before do
        @recipient_type = :cc
      end

      it_should_behave_like 'something that sets the current email for recipients'
    end

    describe 'for mails with recipients in the bcc address' do
      before do
        @recipient_type = :bcc
      end

      it_should_behave_like 'something that sets the current email for recipients'
    end
  end
end

