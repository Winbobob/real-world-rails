# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.dirname(__FILE__) + '/sample_emails/dropbox'

require "fat_free_crm/mail_processor/dropbox"

describe FatFreeCRM::MailProcessor::Dropbox do
  include MockIMAP

  before(:each) do
    @mock_address = "dropbox@example.com"
    @crawler = FatFreeCRM::MailProcessor::Dropbox.new
  end

  #------------------------------------------------------------------------------
  describe "Running the crawler" do
    before(:each) do
      mock_connect
      mock_disconnect
      mock_message(DROPBOX_EMAILS[:plain])
    end

    it "should discard a message if it's invalid" 


    it "should discard a message if it can't find the user" 


    it "should process a message if it finds the user" 

  end

  #------------------------------------------------------------------------------
  describe "Pipeline: processing keywords on the first line" do
    before(:each) do
      mock_connect
      mock_disconnect
      create(:user, email: "aaron@example.com")
    end

    it "should find the named asset and attach the email message" 


    it "should create the named asset and attach the email message" 


    it "should find the lead and attach the email message" 


    it "should create the lead and attach the email message" 


    it "should find the contact and attach the email message" 


    it "should create the contact and attach the email message" 


    it "should move on if first line has no keyword" 

  end

  #------------------------------------------------------------------------------
  describe "Pipeline: processing recipients (To: recipient, Bcc: dropbox)" do
    before(:each) do
      mock_connect
      mock_disconnect
      mock_message(DROPBOX_EMAILS[:plain])
      create(:user, email: "aaron@example.com")
    end

    it "should find the asset and attach the email message" 


    it "should create the asset and attach the email message" 

  end

  #------------------------------------------------------------------------------
  describe "Pipeline: processing forwarded recipient (To: dropbox)" do
    before(:each) do
      mock_connect
      mock_disconnect
      create(:user, email: "aaron@example.com")
      mock_message(DROPBOX_EMAILS[:forwarded])
    end

    it "should find the asset and attach the email message" 


    it "should touch the asset" 


    it "should change lead's status (:new => :contacted)" 


    it "should move on if forwarded recipient did not match" 

  end

  #------------------------------------------------------------------------------
  describe "Pipeline: processing forwarded recipient from email sent to dropbox alias address" do
    before(:each) do
      @mock_address = "dropbox-alias-address@example.com"
      mock_connect
      mock_disconnect

      @settings = @crawler.instance_variable_get("@settings")
      @settings[:address_aliases] = ["dropbox@example.com"]

      create(:user, email: "aaron@example.com")
      mock_message(DROPBOX_EMAILS[:forwarded])
    end

    it "should not match the dropbox email address if routed to an alias" 

  end

  #------------------------------------------------------------------------------
  describe "Pipeline: creating recipient if s/he was not found" do
    before(:each) do
      mock_connect
      mock_disconnect
      create(:user, email: "aaron@example.com")
    end

    it "should create a contact from the email recipient (To: recipient, Bcc: dropbox)" 


    it "should create a contact from the forwarded email (To: dropbox)" 

  end

  #------------------------------------------------------------------------------
  describe "Extracting body" do
    before do
      @dropbox = FatFreeCRM::MailProcessor::Dropbox.new
    end

    it "should extract text from multipart text/plain" 


    it "should extract text and strip tags from multipart text/html" 

  end

  #------------------------------------------------------------------------------
  describe "Default values" do
    describe "'access'" do
      it "should be 'Private' if default setting is 'Private'" 


      it "should be 'Public' if default setting is 'Public'" 


      it "should be 'Private' if default setting is 'Shared'" 

    end
  end
end

