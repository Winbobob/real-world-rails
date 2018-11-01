require File.dirname(__FILE__) + '/../spec_helper'

describe EmailSpec::Helpers do
  include EmailSpec::Helpers

  describe "#visit_in_email" do
    it "visits the link in the email" 


    it "raises an exception when an email is not found" 

  end

  describe "#parse_email_for_link" do
    it "properly finds links with text" 


    it "properly finds links with text surrounded by tags" 


    it "properly finds links with tags and text in new lines" 


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

    describe "#request_uri(link)" do
      context "without query and anchor" do
        it "returns the path" 

      end

      context "with query and anchor" do
        it "returns the path and query and the anchor" 

      end

      context "with anchor" do
        it "returns the path and query and the anchor" 

      end
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

  describe '#open_email' do

    describe 'from' do

      before do
        @to = "jimmy_bean@yahoo.com"
        @email = Mail::Message.new(:to => @to, :from => "foo@bar.com")
        allow(self).to receive(:mailbox_for).with(@to).and_return([@email])
      end

      it "should open the email from someone" 


    end

    describe 'with subject' do
      shared_examples_for 'something that opens the email with subject' do
        before do
          @to = "jimmy_bean@yahoo.com"
          @email = Mail::Message.new(:to => @to, :subject => @subject)
          allow(self).to receive(:mailbox_for).with(@to).and_return([@email])
        end

        it "should open the email with subject" 

      end

      describe 'simple string subject' do
        before do
          @subject  = 'This is a simple subject'
          @expected = 'a simple'
        end

        it_should_behave_like 'something that opens the email with subject'
      end

      describe 'string with regex sensitive characters' do
        before do
          @subject  = '[app name] Contains regex characters?'
          @expected = 'regex characters?'
        end

        it_should_behave_like 'something that opens the email with subject'
      end

      describe 'regular expression' do
        before do
          @subject = "This is a simple subject"
          @expected = /a simple/
        end

        it_should_behave_like 'something that opens the email with subject'
      end
    end

    describe 'with text' do
      shared_examples_for 'something that opens the email with text' do
        before do
          @to = "jimmy_bean@yahoo.com"
          @email = Mail::Message.new(:to => @to, :body => @body)
          allow(self).to receive(:mailbox_for).with(@to).and_return([@email])
        end

        it "should open the email with text" 

      end

      describe 'simple string text' do
        before do
          @body = 'This is an email body that is very simple'
          @text = 'email body'
        end

        it_should_behave_like 'something that opens the email with text'
      end

      describe 'string with regex sensitive characters' do
        before do
          @body = 'This is an email body. It contains some [regex] characters?'
          @text = '[regex] characters?'
        end

        it_should_behave_like 'something that opens the email with text'
      end

      describe 'regular expression' do
        before do
          @body = 'This is an email body.'
          @text = /an\ email/
        end

        it_should_behave_like 'something that opens the email with text'
      end
    end

    describe "when the email isn't found" do
      it "includes the mailbox that was looked in when an address was provided" 


      it "includes a warning that no mailboxes were searched when no address was provided" 


      describe "search by with_subject" do
        before do
          @email_subject = "Subject of 'Nonexistent Email'"
          begin
            open_email("foo@bar.com", :with_subject => @email_subject)
          rescue EmailSpec::CouldNotFindEmailError => e
            @error = e
          end

          expect(@error).not_to be_nil, "expected an error to get thrown so we could test against it, but didn't catch one"
        end

        it "includes the subject that wasn't found in the error message" 


        it "includes 'with subject' in the error message" 

      end

      describe "search by with_text" do
        before do
          @email_text = "This is a line of text from a 'Nonexistent Email'."
          begin
            open_email("foo@bar.com", :with_text => @email_text)
          rescue EmailSpec::CouldNotFindEmailError => e
            @error = e
          end

          expect(@error).not_to be_nil, "expected an error to get thrown so we could test against it, but didn't catch one"
        end

        it "includes the text that wasn't found in the error message" 


        it "includes 'with text' in the error message" 

      end
    end
  end
end

