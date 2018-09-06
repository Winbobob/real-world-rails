# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "multipart/report emails" do
  
  it "should know if it is a multipart report type" 

  
  describe "delivery-status reports" do
    
    it "should know if it is a deliver-status report" 


    it "should find its message/delivery-status part" 

    
    it "should handle a report that has a human readable message/delivery-status" 


    describe "delivery-status part in a non report email" do
      let(:mail){
        string = read_raw_fixture('emails', 'multipart_report_emails', 'report_422.eml')
        Mail.read_from_string(string.sub("multipart/report; report-type=delivery-status;", "multipart/mixed;"))
      }

      it "does not return a delivery_status_part" 

    end

    describe "multipart reports with more than one address" do
      it "should not crash" 


      it "should not know that a multi address email was bounced" 

    end

    describe "temporary failure" do
      
      before(:each) do
        @mail = read_fixture('emails', 'multipart_report_emails', 'report_422.eml')
      end
      
      it "should be bounced" 

      
      it "should say action 'delayed'" 

      
      it "should give a final recipient" 

      
      it "should give an error code" 

      
      it "should give a diagostic code" 

      
      it "should give a remote-mta" 

      
      it "should be retryable" 

    end

    describe "permanent failure" do
      
      before(:each) do
        @mail = read_fixture('emails', 'multipart_report_emails', 'report_530.eml')
      end
      
      it "should be bounced" 

      
      it "should say action 'failed'" 

      
      it "should give a final recipient" 

      
      it "should give an error code" 

      
      it "should give a diagostic code" 

      
      it "should give a remote-mta" 

      
      it "should be retryable" 

    end

  end

end


