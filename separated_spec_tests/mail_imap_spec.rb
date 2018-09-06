# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "IMAP Retriever" do

  before(:each) do
    Mail.defaults do
      retriever_method :imap, { :address    => 'localhost',
                                :port       => 993,
                                :user_name  => nil,
                                :password   => nil,
                                :enable_ssl => true,
                                :enable_starttls => false }
    end
  end

  describe "find with and without block" do
    it "should find all emails with a given block" 

    it "should get all emails without a given block" 


    it "should get all emails and yield the imap, uid, and email when given a block of arity 3" 


    it "should get all emails and yield the imap, uid, flag, and email when given a block of arity 4" 


  end

  describe "find and options" do
    it "should handle the :count option" 

    it "should handle the :what option" 

    it "should handle the :order option" 

    it "should handle the :mailbox option" 

    it "should handle the :uid option" 

    it "should find the last 10 messages by default" 

    it "should search the mailbox 'INBOX' by default" 


    it "should handle the delete_after_find_option" 


    it "should handle the find_and_delete method" 


    it "should pass :search_charset to IMAP uid_search" 

  end

  describe "last" do
    it "should find the last received messages" 

    it "should find the last received message" 

  end

  describe "first" do
    it "should find the first received messages" 

    it "should find the first received message" 

  end

  describe "all" do
    it "should find all messages" 

  end

  describe "delete_all" do
    it "should delete all messages" 

  end

  describe "connection" do
    it "should raise an Error if no block is given" 

    it "should yield the connection object to the given block" 

  end

  describe "handling of options" do
    it "should set default options" 

    it "should not replace given configuration" 

    it "should ensure utf7 conversion for mailbox names" 

  end

  describe "error handling" do
    it "should finish the IMAP connection if an exception is raised" 

  end

  describe "STARTTLS" do
    before do
      @imap = MockIMAP.new
      allow(MockIMAP).to receive(:new).and_return(@imap)
    end

    it "calls starttls to upgrade" 


    it "conflicts with enable_ssl" 

  end

  describe "authentication mechanism" do
    before(:each) do
      @imap = MockIMAP.new
      allow(MockIMAP).to receive(:new).and_return(@imap)
    end
    it "should be login by default" 

    it "should be changeable" 

  end

end


