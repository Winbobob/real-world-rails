# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "SMTP Delivery Method" do

  before(:each) do
    # Reset all defaults back to original state
    Mail.defaults do
      delivery_method :smtp, { :address              => "localhost",
                               :port                 => 25,
                               :domain               => 'localhost.localdomain',
                               :user_name            => nil,
                               :password             => nil,
                               :authentication       => nil,
                               :enable_starttls      => nil,
                               :enable_starttls_auto => true,
                               :openssl_verify_mode  => nil,
                               :tls                  => nil,
                               :ssl                  => nil,
                               :open_timeout         => nil,
                               :read_timeout         => nil
                                }
    end
    MockSMTP.clear_deliveries
  end

  describe "general usage" do
    it "dot-stuff unterminated last line of the message" 


    it "should send emails from given settings" 


    it "should be able to send itself" 


    it "should be able to return actual SMTP protocol response" 

  end

  describe "enabling tls" do

    def redefine_verify_none(new_value)
      OpenSSL::SSL.send(:remove_const, :VERIFY_NONE)
      OpenSSL::SSL.send(:const_set, :VERIFY_NONE, new_value)
    end

    it "should use OpenSSL::SSL::VERIFY_NONE if a context" 


    it "should ignore OpenSSL::SSL::VERIFY_NONE if it is 0" 

  end

  describe "enabling ssl" do
    def redefine_verify_none(new_value)
      OpenSSL::SSL.send(:remove_const, :VERIFY_NONE)
      OpenSSL::SSL.send(:const_set, :VERIFY_NONE, new_value)
    end

    it "should use OpenSSL::SSL::VERIFY_NONE if a context" 


    it "should ignore OpenSSL::SSL::VERIFY_NONE if it is 0" 


    it "should not set verify mode when none is given" 


    it "should set verify mode if one is given" 

  end

  describe "enabling STARTTLS" do
    it 'should default to automatically detecting STARTTLS' 


    it 'should allow forcing STARTTLS' 

  end

  describe "SMTP Envelope" do

    it "uses the envelope From and To addresses" 


    it "supports the null sender in the envelope from address" 


    it "should not raise errors if there is no envelope From address" 


    it "should raise an error if no recipient if defined" 


    it "should raise on SMTP injection via MAIL FROM newlines" 


    it "should raise on SMTP injection via RCPT TO newlines" 


    it "should raise on SMTP injection via MAIL FROM overflow" 


    it "should raise on SMTP injection via RCPT TO overflow" 

  end
end

