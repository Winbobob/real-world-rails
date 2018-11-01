# frozen_string_literal: true
require 'spec_helper'

describe Mail::ContentIdField do
  # Content-ID Header Field
  #
  # In constructing a high-level user agent, it may be desirable to allow
  # one body to make reference to another.  Accordingly, bodies may be
  # labelled using the "Content-ID" header field, which is syntactically
  # identical to the "Content-ID" header field:
  #
  #   id := "Content-ID" ":" msg-id
  #
  # Like the Content-ID values, Content-ID values must be generated to be
  # world-unique.
  #
  # The Content-ID value may be used for uniquely identifying MIME
  # entities in several contexts, particularly for caching data
  # referenced by the message/external-body mechanism.  Although the
  # Content-ID header is generally optional, its use is MANDATORY in
  # implementations which generate data of the optional MIME media type
  # "message/external-body".  That is, each message/external-body entity
  # must have a Content-ID field to permit caching of such data.
  #
  # It is also worth noting that the Content-ID value has special
  # semantics in the case of the multipart/alternative media type.  This
  # is explained in the section of RFC 2046 dealing with
  # multipart/alternative.


  describe "initialization" do

    it "should initialize" 


    it "should accept a string without the field name" 


    it "should accept a nil value and generate a content_id" 


    it "should allow it to be encoded" 


    it "should allow it to be decoded" 


  end
  
  describe "ensuring only one message ID" do

    it "should not accept a string with multiple message IDs but only return the first" 


    it "should change the message id if given a new message id" 


  end

  describe "instance methods" do
    it "should provide to_s" 


    it "should provide encoded" 

    
    it "should respond to :responsible_for?" 

  end

  describe "generating a message id" do
    it "should generate a message ID if it has no value" 

    
    it "should generate a random message ID" 

  end
end

