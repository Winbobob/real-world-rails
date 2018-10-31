# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'
# 3.6.4. Identification fields
#  
#   Though optional, every message SHOULD have a "Message-ID:" field.
#   Furthermore, reply messages SHOULD have "In-Reply-To:" and
#   "References:" fields as appropriate, as described below.
#   
#   The "Message-ID:" field contains a single unique message identifier.
#   The "References:" and "In-Reply-To:" field each contain one or more
#   unique message identifiers, optionally separated by CFWS.
#   
#   The message identifier (msg-id) is similar in syntax to an angle-addr
#   construct without the internal CFWS.
#  
#  message-id      =       "Message-ID:" msg-id CRLF
#  
#  in-reply-to     =       "In-Reply-To:" 1*msg-id CRLF
#  
#  references      =       "References:" 1*msg-id CRLF
#  
#  msg-id          =       [CFWS] "<" id-left "@" id-right ">" [CFWS]
#  
#  id-left         =       dot-atom-text / no-fold-quote / obs-id-left
#  
#  id-right        =       dot-atom-text / no-fold-literal / obs-id-right
#  
#  no-fold-quote   =       DQUOTE *(qtext / quoted-pair) DQUOTE
#  
#  no-fold-literal =       "[" *(dtext / quoted-pair) "]"
#  
#    The "Message-ID:" field provides a unique message identifier that
#    refers to a particular version of a particular message.  The
#    uniqueness of the message identifier is guaranteed by the host that
#    generates it (see below).  This message identifier is intended to be
#    machine readable and not necessarily meaningful to humans.  A message
#    identifier pertains to exactly one instantiation of a particular
#    message; subsequent revisions to the message each receive new message
#    identifiers.
#     
#    Note: There are many instances when messages are "changed", but those
#    changes do not constitute a new instantiation of that message, and
#    therefore the message would not get a new message identifier.  For
#    example, when messages are introduced into the transport system, they
#    are often prepended with additional header fields such as trace
#    fields (described in section 3.6.7) and resent fields (described in
#    section 3.6.6).  The addition of such header fields does not change
#    the identity of the message and therefore the original "Message-ID:"
#    field is retained.  In all cases, it is the meaning that the sender
#    of the message wishes to convey (i.e., whether this is the same
#    message or a different message) that determines whether or not the
#    "Message-ID:" field changes, not any particular syntactic difference
#    that appears (or does not appear) in the message.

describe Mail::MessageIdField do

  describe "initialization" do

    it "should initialize" 


    it "should accept a string without the field name" 


    it "should accept a nil value and generate a message_id" 


  end
  
  describe "ensuring only one message ID" do

    it "should not accept a string with multiple message IDs but only return the first" 


    it "should change the message id if given a new message id" 


  end

  describe "instance methods" do
    it "should provide to_s" 


    it "should provide encoded" 


    it "should provide decoded" 

    
    it "should respond to :responsible_for?" 

  end

  describe "generating a message id" do
    it "should generate a message ID if it has no value" 

    
    it "should generate a random message ID" 

  end
  
  describe "weird message IDs" do
    it "should be able to parse <000701c874a6$3df7eaf0$b9e7c0d0$@geille@fiscon.com>" 


    it "should be able to parse <.AAA-default-12226,16.1089643496@us-bdb-1201.vdc.amazon.com>" 
    it "should be able to parse <091720041340.19561.414AE9430005E91000004C6922007589429B0702040790040A0E08 0C0703@comcast.net>" 


    it "should be able to parse <3851.1096568577MSOSI1188307:1OSIMS@gamefly.com>" 


    it "should be able to parse <3851.1096568577MSOSI1188307:1OSIMS@gamefly.com >" 


    it "should be able to parse <000301caf03a$77d922ae$82dba8c0@.pool.ukrtel.net>" 

  
    it 'should be able to parse <"urn:correios:msg:2011071303483114f523ef89e040878bca2e451a999448"@1310528911569.rte-svc-na-5006.iad5.amazon.com>' 


    it 'should be able to parse <7467BC5DC7CCEB429E2D3F05E49B3067375E6DC038@EXVMBX020-10.exch020.server...' 


    it 'should be able to parse |2a26f8f146e27159|' 


  end
end

