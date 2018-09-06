# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

def encode_base64(str)
  Mail::Encodings::Base64.encode(str)
end

def check_decoded(actual, expected)
  if RUBY_VERSION >= '1.9'
    expect(actual.encoding).to eq Encoding::BINARY
    expect(actual).to eq expected.dup.force_encoding(Encoding::BINARY)
  else
    expect(actual).to eq expected
  end
end

describe "Attachments" do

  before(:each) do
    @mail = Mail.new
    @test_png = read_raw_fixture('attachments', 'test.png')
  end

  describe "from direct content" do
    it "should work" 


    it "should work out magically the mime_type" 


    it "should assign the filename" 


    it "should assign mime-encoded multibyte filename" 

  end

  describe "from a supplied Hash" do
    it "should work" 


    it "should allow you to override the content_type" 


    it "should allow you to override the mime_type" 


    it "should allow you to override the mime_type" 


  end

  describe "decoding and encoding" do

    it "should set its content_transfer_encoding" 


    it "should encode its body to base64" 


    it "should allow you to pass in an encoded attachment with an encoding" 


    it "should allow you set a mime type and encoding without overriding the encoding" 


    it "should not allow you to pass in an encoded attachment with an unknown encoding" 


   it "should be able to call read on the attachment to return the decoded data" 
    it "should only add one newline between attachment body and boundary" 


  end

  describe "multiple attachments" do

    it "should allow you to pass in more than one attachment" 


  end

  describe "inline attachments" do

    it "should set the content_disposition to inline or attachment as appropriate" 


    it "should return a cid" 


    it "should respond true to inline?" 

  end

  describe "getting the content ID from an attachment" do
    before(:each) do
      @mail = Mail.new
      @mail.attachments['test.gif'] = read_raw_fixture('attachments', 'test.gif')
      expect(@mail.attachments['test.gif'].has_content_id?).to be_falsey
      @mail.attachments['test.gif'].add_content_id
      @cid = @mail.attachments['test.gif'].content_id
      expect(@cid).not_to be_nil
    end

    it "should return a valid content-id on inline attachments" 


    it "should provide a URL escaped content_id (without brackets) for use inside an email" 

  end

  describe "setting the content type correctly" do
    it "should set the content type to multipart/mixed if none given and you add an attachment" 


    it "allows you to set the attachment before the content type" 


  end

  describe "should handle filenames with non-7bit characters correctly" do
    it "should not raise an exception with a filename that contains a non-7bit-character" 

  end

end

describe "reading emails with attachments" do
  describe "test emails" do

    it "should find the attachment using content location" 


    it "should find an attachment defined with 'name' and Content-Disposition: attachment" 


    it "should use the content-disposition filename over the content-type filename or name" 


    it "should decode an attachment" 


    it "should decode an attachment with linefeeds" 


    it "should find an attachment that has an encoded name value" 


    it "should find an attachment that has a name not surrounded by quotes" 


    it "should decode an attachment without ascii compatible filename" 


    it "should find attachments inside parts with content-type message/rfc822" 


    it "attach filename decoding (issue 83)" 


  end
end

describe "attachment order" do
  it "should be preserved instead  when content type exists" 

end

