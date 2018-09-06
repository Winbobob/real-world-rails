# encoding: UTF-8

require "spec_helper"

describe Rack::Test::Session do

  def test_file_path
    File.dirname(__FILE__) + "/../../fixtures/foo.txt"
  end

  def second_test_file_path
    File.dirname(__FILE__) + "/../../fixtures/bar.txt"
  end

  def uploaded_file
    Rack::Test::UploadedFile.new(test_file_path)
  end

  def second_uploaded_file
    Rack::Test::UploadedFile.new(second_test_file_path)
  end

  context "uploading a file" do
    it "sends the multipart/form-data content type" 


    it "sends regular params" 


    it "sends nested params" 


    it "sends multiple nested params" 


    it "sends params with arrays" 


    it "sends params with encoding sensitive values" 


    it "sends params encoded as ISO-8859-1" 


    it "sends params with parens in names" 


    it "sends params with encoding sensitive names" 


    it "sends files with the filename" 


    it "sends files with the text/plain MIME type by default" 


    it "sends files with the right name" 


    it "allows overriding the content type" 


    it "sends files with a Content-Length in the header" 


    it "sends files as Tempfiles" 

  end


  context "uploading two files" do
    it "sends the multipart/form-data content type" 


    it "sends files with the filename" 


    it "sends files with the text/plain MIME type by default" 


    it "sends files with the right names" 


    it "allows mixed content types" 


    it "sends files with a Content-Length in the header" 


    it "sends both files as Tempfiles" 

  end
end

