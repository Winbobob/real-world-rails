# frozen_string_literal: true

# Copyright (c) 2008-2013 Michael Dvorkin and contributors.
#
# Fat Free CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
require File.dirname(__FILE__) + '/sample_emails/dropbox'

require "fat_free_crm/mail_processor/base"

describe FatFreeCRM::MailProcessor::Base do
  include MockIMAP

  before do
    @mock_address = "base-mail-processor@example.com"
  end

  before(:each) do
    @crawler = FatFreeCRM::MailProcessor::Base.new
    # MailProcessor::Base doesn't load any settings by default
    @crawler.instance_variable_set "@settings",
                                   server:   "example.com",
                                   port:     "123",
                                   ssl:      true,
                                   address:  "test@example.com",
                                   user:     "test@example.com",
                                   password: "123"
  end

  #------------------------------------------------------------------------------
  describe "Connecting to the IMAP server" do
    it "should connect to the IMAP server and login as user, and select folder" 


    it "should connect to the IMAP server, login as user, but not select folder when requested so" 


    it "should raise the error if connection fails" 

  end

  #------------------------------------------------------------------------------
  describe "Disconnecting from the IMAP server" do
    it "should logout and diconnect" 

  end

  #------------------------------------------------------------------------------
  describe "Discarding a message" do
    before(:each) do
      mock_connect
      @uid = double
      @crawler.send(:connect!)
    end

    it "should copy message to invalid folder if it's set and flag the message as deleted" 


    it "should not copy message to invalid folder if it's not set and flag the message as deleted" 

  end

  #------------------------------------------------------------------------------
  describe "Archiving a message" do
    before(:each) do
      mock_connect
      @uid = double
      @crawler.send(:connect!)
    end

    it "should copy message to archive folder if it's set and flag the message as seen" 


    it "should not copy message to archive folder if it's not set and flag the message as seen" 

  end

  #------------------------------------------------------------------------------
  describe "Validating email" do
    before(:each) do
      @email = double
    end

    it "should be valid email if its contents type is text/plain" 


    it "should be invalid email if its contents type is not text/plain" 

  end

  #------------------------------------------------------------------------------
  describe "Finding email sender among users" do
    before(:each) do
      @from = ["Aaron@Example.Com", "Ben@Example.com"]
      @email = double
      allow(@email).to receive(:from).and_return(@from)
    end

    it "should find non-suspended user that matches From: field" 


    it "should not find user if his email doesn't match From: field" 


    it "should not find user if his email matches From: field but is suspended" 


    #------------------------------------------------------------------------------
    describe "Extracting plain text body" do
      it "should extract text from multipart text/plain" 


      it "should extract text and strip tags from multipart text/html" 

    end
  end
end

