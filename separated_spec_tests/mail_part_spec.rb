# frozen_string_literal: true
require 'spec_helper'

describe Mail::Part do

  it "should not add a default Content-ID" 


  it "should not add a default Content-ID to non-inline attachments" 


  it "should add a default Content-ID to inline attachments" 


  it "should not add a Date, MIME-Version, or Message-ID" 


  it "should preserve any content id that you put into it" 


  it "should return an inline content_id" 



  it "should URL escape its inline content_id" 


  it "should add a content_id if there is none and is asked for an inline_content_id" 


  it "should respond correctly to inline?" 


  it "handles un-parsable content_disposition headers" 


  describe "parts that have a missing header" do
    it "should not try to init a header if there is none" 

  end

  describe "delivery status reports" do
    before do
      @delivery_report = Mail::Part.new(Mail::Utilities.to_crlf(<<ENDPART))
Content-Type: message/delivery-status

Reporting-MTA: dns; mail12.rrrr.com.au
Received-From-MTA: DNS; 60-0-0-146.static.tttttt.com.au
Arrival-Date: Mon, 24 Dec 2007 10:03:47 +1100

Final-Recipient: RFC822; edwin@zzzzzzz.com
Action: failed
Status: 5.3.0
Remote-MTA: DNS; mail.zzzzzz.com
Diagnostic-Code: SMTP; 553 5.3.0 <edwin@zzzzzzz.com>... Unknown E-Mail Address
Last-Attempt-Date: Mon, 24 Dec 2007 10:03:53 +1100
ENDPART
    end

    it "should know if it is a delivery-status report" 


    it "should create a delivery_status_data header object" 


    it "should be bounced" 


    it "should say action 'delayed'" 


    it "should give a final recipient" 


    it "should give an error code" 


    it "should give a diagostic code" 


    it "should give a remote-mta" 


    it "should be retryable" 


    context "on a part without a certain field" do
      before(:each) do
        @delivery_report = Mail::Part.new(Mail::Utilities.to_crlf(<<ENDPART))
Content-Type: message/delivery-status

Reporting-MTA: dns; mail12.rrrr.com.au
Received-From-MTA: DNS; 60-0-0-146.static.tttttt.com.au
Arrival-Date: Mon, 24 Dec 2007 10:03:47 +1100

Final-Recipient: RFC822; edwin@zzzzzzz.com
Action: failed
Status: 5.3.0
Remote-MTA: DNS; mail.zzzzzz.com
Last-Attempt-Date: Mon, 24 Dec 2007 10:03:53 +1100
ENDPART
      end

      it "returns nil" 

    end
  end

  it "should correctly parse plain text raw source and not truncate after newlines - issue 208" 


  describe "negotiating transfer encoding" do
    it "doesn't override part encoding when it's compatible with message" 


    it "retains specified encoding even though it isn't lowest cost" 

  end
end

