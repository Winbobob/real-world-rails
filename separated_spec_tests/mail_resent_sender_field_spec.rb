# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

# resent-sender   =       "Resent-Sender:" mailbox CRLF
describe Mail::ResentSenderField do
  let :field do
    Mail::ResentSenderField.new('Mikel Lindsaar <mikel@test.lindsaar.net>')
  end

  describe "initialization" do

    it "should initialize" 


    it "should accept a string without the field name" 


  end

  it "formats the sender" 


  it "parses a single sender address" 


  it "returns the field value" 


  it "encodes a header line" 

end

