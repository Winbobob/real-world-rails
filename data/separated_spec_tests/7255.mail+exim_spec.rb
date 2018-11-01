# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "exim delivery agent" do
  let :mail do
    Mail.new do
      from    'roger@test.lindsaar.net'
      to      'marcel@test.lindsaar.net, bob@test.lindsaar.net'
      subject 'some subject'
    end
  end

  before do
    Mail.defaults do
      delivery_method :exim
    end
  end

  it "should send an email using exim" 


  describe "return path" do
    it "should send an email with a return-path using exim" 


    it "should use the sender address is no return path is specified" 


    it "should use the from address is no return path or sender are specified" 


    it "should escape the return path address" 


    it 'should not escape ~ in return path address' 

  end

  it "should still send an email if the settings have been set to nil" 


  it "should escape evil haxxor attemptes" 


  it "should raise an error if no sender is defined" 


  it "should raise an error if no recipient if defined" 

end

