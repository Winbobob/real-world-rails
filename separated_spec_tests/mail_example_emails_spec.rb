# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "Test emails" do

  describe "from RFC2822" do

    # From RFC 2822:
    # This could be called a canonical message.  It has a single author,
    # John Doe, a single recipient, Mary Smith, a subject, the date, a
    # message identifier, and a textual message in the body.
    it "should handle the basic test email" 


    # From RFC 2822:
    # If John's secretary Michael actually sent the message, though John
    # was the author and replies to this message should go back to him, the
    # sender field would be used:
    it "should handle the sender test email" 


    # From RFC 2822:
    # This message includes multiple addresses in the destination fields
    # and also uses several different forms of addresses.
    #
    # Note that the display names for Joe Q. Public and Giant; "Big" Box
    # needed to be enclosed in double-quotes because the former contains
    # the period and the latter contains both semicolon and double-quote
    # characters (the double-quote characters appearing as quoted-pair
    # construct).  Conversely, the display name for Who? could appear
    # without them because the question mark is legal in an atom.  Notice
    # also that jdoe@example.org and boss@nil.test have no display names
    # associated with them at all, and jdoe@example.org uses the simpler
    # address form without the angle brackets.
    #
    # "Giant; \"Big\" Box" <sysservices@example.net>
    it "should handle multiple recipients test email" 


    # From RFC 2822:
    # A.1.3. Group addresses
    # In this message, the "To:" field has a single group recipient named A
    # Group which contains 3 addresses, and a "Cc:" field with an empty
    # group recipient named Undisclosed recipients.
    it "should handle group address email test" 



    # From RFC 2822:
    # A.2. Reply messages
    # The following is a series of three messages that make up a
    # conversation thread between John and Mary.  John firsts sends a
    # message to Mary, Mary then replies to John's message, and then John
    # replies to Mary's reply message.
    #
    # Note especially the "Message-ID:", "References:", and "In-Reply-To:"
    # fields in each message.
    it "should handle reply messages" 


    # From RFC 2822:
    # When sending replies, the Subject field is often retained, though
    # prepended with "Re: " as described in section 3.6.5.
    # Note the "Reply-To:" field in the below message.  When John replies
    # to Mary's message above, the reply should go to the address in the
    # "Reply-To:" field instead of the address in the "From:" field.
    it "should handle reply message 2" 


    # From RFC 2822:
    # Final reply message
    it "should handle the final reply message" 


    # From RFC2822
    # A.3. Resent messages
    # Say that Mary, upon receiving this message, wishes to send a copy of
    # the message to Jane such that (a) the message would appear to have
    # come straight from John; (b) if Jane replies to the message, the
    # reply should go back to John; and (c) all of the original
    # information, like the date the message was originally sent to Mary,
    # the message identifier, and the original addressee, is preserved.  In
    # this case, resent fields are prepended to the message:
    #
    # If Jane, in turn, wished to resend this message to another person,
    # she would prepend her own set of resent header fields to the above
    # and send that.
    it "should handle the rfc resent example email" 


    # A.4. Messages with trace fields
    # As messages are sent through the transport system as described in
    # [RFC2821], trace fields are prepended to the message.  The following
    # is an example of what those trace fields might look like.  Note that
    # there is some folding white space in the first one since these lines
    # can be long.
    it "should handle the RFC trace example email" 


    # A.5. White space, comments, and other oddities
    # White space, including folding white space, and comments can be
    # inserted between many of the tokens of fields.  Taking the example
    # from A.1.3, white space and comments can be inserted into all of the
    # fields.
    #
    # The below example is aesthetically displeasing, but perfectly legal.
    # Note particularly (1) the comments in the "From:" field (including
    # one that has a ")" character appearing as part of a quoted-pair); (2)
    # the white space absent after the ":" in the "To:" field as well as
    # the comment and folding white space after the group name, the special
    # character (".") in the comment in Chris Jones's address, and the
    # folding white space before and after "joe@example.org,"; (3) the
    # multiple and nested comments in the "Cc:" field as well as the
    # comment immediately following the ":" after "Cc"; (4) the folding
    # white space (but no comments except at the end) and the missing
    # seconds in the time of the date field; and (5) the white space before
    # (but not within) the identifier in the "Message-ID:" field.

    it "should handle the rfc whitespace test email" 


    # A.6. Obsoleted forms
    # The following are examples of obsolete (that is, the "MUST NOT
    # generate") syntactic elements described in section 4 of this
    # document.
    # A.6.1. Obsolete addressing
    # Note in the below example the lack of quotes around Joe Q. Public,
    # the route that appears in the address for Mary Smith, the two commas
    # that appear in the "To:" field, and the spaces that appear around the
    # "." in the jdoe address.
    it "should handle the rfc obsolete addressing" 


    # A.6.2. Obsolete dates
    #
    # The following message uses an obsolete date format, including a non-
    # numeric time zone and a two digit year.  Note that although the
    # day-of-week is missing, that is not specific to the obsolete syntax;
    # it is optional in the current syntax as well.
    it "should handle the rfc obsolete dates" 


    # A.6.3. Obsolete white space and comments
    #
    # White space and comments can appear between many more elements than
    # in the current syntax.  Also, folding lines that are made up entirely
    # of white space are legal.
    #
    # Note especially the second line of the "To:" field.  It starts with
    # two space characters.  (Note that "__" represent blank spaces.)
    # Therefore, it is considered part of the folding as described in
    # section 4.2.  Also, the comments and white space throughout
    # addresses, dates, and message identifiers are all part of the
    # obsolete syntax.
    it "should handle the rfc obsolete whitespace email" 


    it "should handle folding subject" 

  end

  describe "from the wild" do

    describe "raw_email_encoded_stack_level_too_deep.eml" do
      before(:each) do
        @message = read_fixture('emails', 'mime_emails', 'raw_email_encoded_stack_level_too_deep.eml')
      end

      it "should return an 'encoded' version without raising a SystemStackError" 


      it "should have two parts" 


    end

    describe "sig_only_email.eml" do
      before(:each) do
        @message = read_fixture('emails', 'mime_emails', 'sig_only_email.eml')
      end

      it "should not error on multiart/signed emails" 


      it "should have one attachment called signature.asc" 


    end

    describe "handling invalid group lists" do
      before(:each) do
        @message = read_fixture('emails', 'error_emails', 'empty_group_lists.eml')
      end

      it "should parse the email and encode without crashing" 


      it "should return an empty groups list" 

    end

  end

  describe "empty address lists" do

    before(:each) do
      @message = read_fixture('emails', 'error_emails', 'weird_to_header.eml')
    end

    it "should parse the email and encode without crashing" 


    it "should return an empty groups list" 


  end

  describe 'RFC6532 UTF8 headers' do
    before :each do
      @message = read_fixture('emails', 'rfc6532', 'utf8_headers.eml')
    end

    it 'subject' 


    it 'from' 


    it 'to' 

  end

  describe "invalid charsets in headers" do
    it "falls back to ASCII-8BIT for unrecognized charsets" 

  end
end

