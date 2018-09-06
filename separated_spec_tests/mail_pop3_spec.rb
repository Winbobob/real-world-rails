# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "POP3 Retriever" do

  before(:each) do
    # Reset all defaults back to original state
    Mail.defaults do
      retriever_method :pop3, { :address             => "localhost",
                                :port                => 995,
                                :user_name           => nil,
                                :password            => nil,
                                :enable_ssl          => true }
    end
  end


  describe "find with and without block" do

    it "should find all emails with a given block" 


    it "should get all emails without a given block" 


  end

  describe "find and options" do

    it "should handle the :count option" 


    it "should handle the :what option" 


    it "should handle the :order option" 


    it "should find the last 10 messages by default" 


    it "should handle the delete_after_find option" 


    it "should handle the find_and_delete method" 


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
    it "should delete all mesages" 

  end

  describe "connection" do
    it "should raise an Error if no block is given" 

    it "should yield the connection object to the given block" 

  end

  describe "handling of options" do

    it "should set default options" 


    it "should not replace given configuration" 


  end

  describe "error handling" do

    it "should finish the POP3 connection is an exception is raised" 


  end

  describe "read_timeout option" do

    it "should override the POP3 default read_timeout" 


  end

end

