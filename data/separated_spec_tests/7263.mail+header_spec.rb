# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::Header do

  describe "initialization" do

    it "should instantiate empty" 


    it "should instantiate with a string passed in" 


  end

  describe "copying" do

    it "should instantiate with a string passed in" 


  end

  describe "instance methods" do

    it "should save away the raw source of the header that it is passed" 


    it "should say if it has a message_id field defined" 


    it "should say if it has a message_id field defined" 


    it "should say if it has a content_id field defined" 


    it "should say if it has a content_id field defined" 


    it "should know its own charset" 


    it "should know its own charset if set" 


    it "should not unset previously set charset if content-type is set without charset" 


    it "shouldn't die when queried for a charset and the content-type header is invalid" 


    it "should be Enumerable" 

  end

  describe "creating fields" do
      it "should recognise a bcc field" 


      it "should recognise a cc field" 


      it "should recognise a content-description field" 


      it "should recognise a content-disposition field" 


      it "should recognise an inline content-disposition field" 



      it "should recognise a content-id field" 


      it "should recognise a content-transfer-encoding field" 


      it "should recognise a content-type field" 


      it "should recognise a date field" 


      it "should recognise a from field" 


      it "should recognise a in-reply-to field" 


      it "should recognise a keywords field" 


      it "should recognise a message-id field" 


      it "should recognise a mime-version field" 


      it "should recognise a received field" 


      it "should recognise a references field" 


      it "should recognise a reply-to field" 


      it "should recognise a resent-bcc field" 


      it "should recognise a resent-cc field" 


      it "should recognise a resent-date field" 


      it "should recognise a resent-from field" 


      it "should recognise a resent-message-id field" 


      it "should recognise a resent-sender field" 


      it "should recognise a resent-to field" 


      it "should recognise a return-path field" 


      it "should recognise a sender field" 


      it "should recognise a to field" 


      it "should maintain header case" 


      it "should not accept field names containing colons" 


    end


  describe "parsing" do

    it "should split the header into separate fields" 


    it "should not split a wrapped header in two" 


    #  Header fields are lines composed of a field name, followed by a colon
    #  (":"), followed by a field body, and terminated by CRLF.  A field
    #  name MUST be composed of printable US-ASCII characters (i.e.,
    #  characters that have values between 33 and 126, inclusive), except
    #  colon.
    it "should accept any valid header field name" 


    it "should not try to accept colons in header field names" 


    # A field body may be composed of any US-ASCII characters,
    # except for CR and LF.  However, a field body may contain CRLF when
    # used in header "folding" and  "unfolding" as described in section
    # 2.2.3.
    it "should accept any valid header field value" 


    it "should split each field into an name and value" 


    it "should split each field into an name and value - even if whitespace is missing" 


    it "should preserve the order of the fields it is given" 


    it "should allow you to reference each field and value by literal string name" 


    it "should return an array of fields if there is more than one match" 


    it "should return nil if no value in the header" 


    it "should add a new field if the field does not exist" 


    it "should allow you to pass in an array of raw fields" 


    it "should reset the value of a single-only field if it already exists" 


    it "should allow you to delete a field by setting it to nil" 


    it "should delete all matching fields found if there are multiple options" 


    it "should delete only matching fields found" 


    # Handle empty X-Optional header from Microsoft Exchange
    it "should handle an empty X-* header value" 


    it "should accept X- option fields from MS-Exchange" 


    it "should return nil if asked for the value of a non existent field" 


    it "should allow you to replace a from field" 


    it "should maintain the class of the field" 

  end

  describe "folding and unfolding" do

    it "should unfold a header" 


    it "should preserve whitespace when unfolding a header" 


    it "should handle a crazy long folded header" 


    it "should convert all lonesome LFs to CRLF" 


    if RUBY_VERSION >= '1.9'
      it "should convert all lonesome LFs to CRLF in UTF-8 too" 

    end


    it "should convert all lonesome CRs to CRLF" 


  end

  describe "error handling" do
    it "should collect up any of its fields' errors" 

  end

  describe "handling date fields with multiple values" do
    it "should know which fields can only appear once" 


    it "should know which fields can only appear once" 


    it "should enforce appear-once rule even with mass assigned header" 


    it "should add additional fields that can appear more than once" 


    it "should delete all references to a field" 

  end

  describe "handling trace fields" do

    before(:each) do
      trace_header =<<TRACEHEADER
Return-Path: <xxx@xxxx.xxxtest>
Received: from xxx.xxxx.xxx by xxx.xxxx.xxx with ESMTP id 6AAEE3B4D23 for <xxx@xxxx.xxx>; Sun, 8 May 2005 12:30:23 -0500
Received: from xxx.xxxx.xxx by xxx.xxxx.xxx with ESMTP id j48HUC213279 for <xxx@xxxx.xxx>; Sun, 8 May 2005 12:30:13 -0500
Received: from conversion-xxx.xxxx.xxx.net by xxx.xxxx.xxx id <0IG600901LQ64I@xxx.xxxx.xxx> for <xxx@xxxx.xxx>; Sun, 8 May 2005 12:30:12 -0500
Received: from agw1 by xxx.xxxx.xxx with ESMTP id <0IG600JFYLYCAxxx@xxxx.xxx> for <xxx@xxxx.xxx>; Sun, 8 May 2005 12:30:12 -0500
TRACEHEADER
      @traced_header = Mail::Header.new(trace_header)
    end

    it "should instantiate one trace field object per header" 


    it "should add a new received header after the other received headers if they exist" 


  end

  describe "encoding" do
    it "should output a parsed version of itself to US-ASCII on encoded and tidy up and sort correctly" 


    if '1.9'.respond_to?(:force_encoding)
      it "should not blow up on encoding mismatches" 

    end
  end

  describe "detecting required fields" do
    it "should not say it has a message id if it doesn't" 


    it "should say it has a message id if it does" 


    it "should not say it has a date if it doesn't" 


    it "should say it has a date id if it does" 


    it "should not say it has a mime-version if it doesn't" 


    it "should say it has a date id if it does" 

  end

  describe "mime version handling" do
    it "should return the mime version of the email" 


    it "should return nil if no mime-version header field" 


    it "should return the transfer-encoding of the email" 


    it "should return nil if no transfer-encoding header field" 


    it "should return the content-description of the email" 


    it "should return nil if no content-description header field" 


  end

  describe "configuration option .maximum_amount" do

    it "should be 1000 by default" 


    it "should limit amount of parsed headers" 


  end

end

