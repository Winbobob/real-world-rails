# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'reply_handler'

describe MailHandler::ReplyHandler do
  describe ".forward_on" do
    describe "non-bounce messages" do
      let(:raw_email) { load_file_fixture("normal-contact-reply.email") }
      let(:message) { MailHandler.mail_from_raw_email(raw_email) }

      it "should forward the message to sendmail" 

    end
  end

  describe ".get_forward_to_address" do
    let(:pro_message) do
      raw_email = load_file_fixture("pro-contact-reply.email")
      MailHandler.mail_from_raw_email(raw_email)
    end

    let(:normal_message) do
      raw_email = load_file_fixture("normal-contact-reply.email")
      MailHandler.mail_from_raw_email(raw_email)
    end

    context "if alaveteli pro is disabled" do
      before do
        allow(AlaveteliConfiguration).
          to receive(:enable_alaveteli_pro).and_return(false)
      end

      it "returns the normal forwarding address" 

    end

    context "if alaveteli pro is enabled" do
      before do
        allow(AlaveteliConfiguration).
          to receive(:enable_alaveteli_pro).and_return(true)
      end

      context "and the email is replying to the pro contact" do
        it "returns the pro forwarding address" 

      end

      context "and the email is replying to the normal contact" do
        it "returns the normal contact address" 

      end
    end
  end
end

