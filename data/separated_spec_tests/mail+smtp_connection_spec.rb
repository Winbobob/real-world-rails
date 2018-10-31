# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "SMTP Delivery Method" do

  before(:each) do
    Mail.defaults do
      smtp = Net::SMTP.start('127.0.0.1', 25)
      delivery_method :smtp_connection, :connection => smtp
    end
  end

  after(:each) do
    Mail.delivery_method.smtp.finish
  end

  it "dot-stuff unterminated last line of the message" 


  it "should send an email using open SMTP connection" 


  it "should be able to return actual SMTP protocol response" 



  it "should not raise errors if no sender is defined" 


  it "should raise an error if no recipient if defined" 

end

