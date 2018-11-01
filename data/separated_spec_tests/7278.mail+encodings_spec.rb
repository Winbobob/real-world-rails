# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::Encodings do

  describe "base64 Encoding" do

    it "should return true for base64" 


    it "should return true for Base64" 


    it "should return true for :base64" 


    it "should return the Base64 Encoding class" 


    it "should return the base64 Encoding class" 


    it "should return the base64 Encoding class" 


  end

  describe "quoted-printable Encoding" do

    it "should return true for quoted-printable" 


    it "should return true for Quoted-Printable" 


    it "should return true for :quoted_printable" 


    it "should return the QuotedPrintable Encoding class" 


    it "should return the QuotedPrintable Encoding class" 


    it "should return the QuotedPrintable Encoding class" 


  end

  describe "B encodings" do
    # From rfc2047:
    # From: =?US-ASCII?Q?Keith_Moore?= <moore@cs.utk.edu>
    # To: =?ISO-8859-1?Q?Keld_J=F8rn_Simonsen?= <keld@dkuug.dk>
    # CC: =?ISO-8859-1?Q?Andr=E9?= Pirard <PIRARD@vm1.ulg.ac.be>
    # Subject: =?ISO-8859-1?B?SWYgeW91IGNhbiByZWFkIHRoaXMgeW8=?=
    #  =?ISO-8859-2?B?dSB1bmRlcnN0YW5kIHRoZSBleGFtcGxlLg==?=
    #
    # Note: In the first 'encoded-word' of the Subject field above, the
    # last "=" at the end of the 'encoded-text' is necessary because each
    # 'encoded-word' must be self-contained (the "=" character completes a
    # group of 4 base64 characters representing 2 octets).  An additional
    # octet could have been encoded in the first 'encoded-word' (so that
    # the encoded-word would contain an exact multiple of 3 encoded
    # octets), except that the second 'encoded-word' uses a different
    # 'charset' than the first one.
    #
    it "should just return the string if us-ascii and asked to B encoded string" 


    it "should accept other encodings" 


    it "should correctly encode long string mixing with single/multi-byte characters" 


    it "should complain if there is no encoding passed for Ruby < 1.9" 


    it "should split the string up into bite sized chunks that can be wrapped easily" 


    it "should decode an encoded string" 


    it "should decode a long encoded string" 


    it "should decode UTF-16 encoded string" 


    it "should decode UTF-32 encoded string" 


    it "should decode a string that looks similar to an encoded string (contains '=?')" 


    it "should parse adjacent encoded-words separated by linear white-space" 


    it "should parse adjacent words with no space" 


    it "should collapse adjacent words with multiple encodings on one line seperated by non-spaces" 


    it "should decode a blank string" 


    it "should decode a string, even with an invalid encoding name" 


    if '1.9'.respond_to?(:force_encoding)
      it "should decode 8bit encoded string" 


      it "should decode ks_c_5601-1987 encoded string" 


      it "should decode shift-jis encoded string" 


      it "should decode GB18030 encoded string misidentified as GB2312" 

    end
  end

  describe "Q encodings" do
    # From rfc2047:
    # From: =?US-ASCII?Q?Keith_Moore?= <moore@cs.utk.edu>
    # To: =?ISO-8859-1?Q?Keld_J=F8rn_Simonsen?= <keld@dkuug.dk>
    # CC: =?ISO-8859-1?Q?Andr=E9?= Pirard <PIRARD@vm1.ulg.ac.be>
    # Subject: =?ISO-8859-1?B?SWYgeW91IGNhbiByZWFkIHRoaXMgeW8=?=
    #  =?ISO-8859-2?B?dSB1bmRlcnN0YW5kIHRoZSBleGFtcGxlLg==?=
    #
    # Note: In the first 'encoded-word' of the Subject field above, the
    # last "=" at the end of the 'encoded-text' is necessary because each
    # 'encoded-word' must be self-contained (the "=" character completes a
    # group of 4 base64 characters representing 2 octets).  An additional
    # octet could have been encoded in the first 'encoded-word' (so that
    # the encoded-word would contain an exact multiple of 3 encoded
    # octets), except that the second 'encoded-word' uses a different
    # 'charset' than the first one.
    #
    it "should just return the string if us-ascii and asked to Q encoded string" 


    it "should complain if there is no encoding passed for Ruby < 1.9" 


    it "should accept other character sets" 


    it "should decode an encoded string" 


    it "should decode q encoded =5F as underscore" 


    it "should not fold a long string that has no spaces" 


    it "should round trip a complex string properly" 


    it "should round trip another complex string (koi-8)" 


    it "should decode a blank string" 


    it "should decode a string with spaces" 


    it "should treat unrecognized charsets as binary" 

  end

  describe "mixed Q and B encodings" do
    it "should decode an encoded string" 

  end

  describe "parameter MIME encodings" do
    #  Character set and language information may be combined with the
    #  parameter continuation mechanism. For example:
    #
    #  Content-Type: application/x-stuff
    #   title*0*=us-ascii'en'This%20is%20even%20more%20
    #   title*1*=%2A%2A%2Afun%2A%2A%2A%20
    #   title*2="isn't it!"
    #
    #  Note that:
    #
    #   (1)   Language and character set information only appear at
    #         the beginning of a given parameter value.
    #
    #   (2)   Continuations do not provide a facility for using more
    #         than one character set or language in the same
    #         parameter value.
    #
    #   (3)   A value presented using multiple continuations may
    #         contain a mixture of encoded and unencoded segments.
    #
    #   (4)   The first segment of a continuation MUST be encoded if
    #         language and character set information are given.
    #
    #   (5)   If the first segment of a continued parameter value is
    #         encoded the language and character set field delimiters
    #         MUST be present even when the fields are left blank.
    #

    before(:each) do
      Mail.defaults do
        param_encode_language('en')
      end
    end

    it "should leave an unencoded string alone" 


    it "should unencode an encoded string" 


    it "should unencoded an encoded string and return the right charset on 1.9" 


    it "should unencode a complete string that included unencoded parts" 


    it "should encode a string" 


    it "should just quote US-ASCII with spaces" 


    it "should leave US-ASCII without spaces alone" 

  end

  describe "decoding a string and detecting the encoding type" do

    it "should detect an encoded Base64 string to the decoded string" 


    it "should detect a multiple encoded Base64 string to the decoded string" 


    it "should detect a multiple encoded Base64 string with a space to the decoded string" 


    it "should detect a multiple encoded Base64 string with a whitespace to the decoded string" 


    it "should decode B and Q encodings together if needed" 


    it "should detect a encoded and unencoded Base64 string to the decoded string" 


    it "should detect an encoded QP string to the decoded string" 


    it "should decode UTF-16 encoded string" 


    it "should decode UTF-32 encoded string" 


    it "should detect multiple encoded QP string to the decoded string" 


    it "should detect multiple encoded QP string with a space to the decoded string" 


    it "should detect multiple encoded QP string with a space to the decoded string" 


    it "should detect a encoded and unencoded QP string to the decoded string" 


    it "should detect a plain string and return it" 


    it "should handle a very long string efficiently" 


    it "should handle Base64 encoded ISO-2022-JP string" 

  end

  describe "altering an encoded text to decoded and visa versa" do

    describe "decoding" do

      if RUBY_VERSION < '1.9'
        before { @original = $KCODE }
        after  { $KCODE = @original }
      end

      it "should detect an encoded Base64 string and return the decoded string" 


      it "should detect an encoded QP string and return the decoded string" 


      it "should detect an a string is already decoded and leave it alone" 


    end

    describe "encoding" do

      it "should encode a string into Base64" 


      it "should leave a string that doesn't need encoding alone" 


    end

    describe "unquote and convert to" do
      it "should unquote quoted printable and convert to utf-8" 


      it "should unquote base64 and convert to utf-8" 


      it "should handle no charset" 


      it "should unquote multiple lines" 


      it "should unquote a string in the middle of the text" 


      it "should unquote and change to an ISO encoding if we really want" 


      it "should unquote Shift_JIS QP with trailing =" 


      it "handles Windows 1252 QP encoding" 


      it "should recognize iso646-us" 


      it "should unquote multiple strings in the middle of the text" 


      it "should handle multiline quoted headers with mixed content" 


      it "should handle quoted string with mixed content that have a plain string at the end" 


      it "should handle utf_8" 


    end
  end

  describe "quoted printable encoding and decoding" do
    it "should handle underscores in the text" 


    it "should handle underscores in the text" 


    it "should keep the underscores in the text" 


    it "should handle a new line in the text" 


  end

  describe "pre encoding non usascii text" do
    it "should not change an ascii string" 


    it "should encode a display that contains non usascii" 


    it "should encode a single token that contains non usascii" 


    it "should encode a display that contains non usascii with quotes as no quotes" 


    it "should encode a display name with us-ascii and non-usascii parts" 


    it "should encode a display name with us-ascii and non-usascii parts ignoring quotes" 


    it "should encode a quoted display name with us-ascii and non-usascii that ends with a non-usascii part" 


    it "should encode multiple addresses correctly" 


    it "should encode multiple addresses correctly when noninitial address contains non-usascii chars" 


    it "should encode multiple unquoted addresses correctly" 


    it "should encode multiple unquoted addresses correctly when noninitial address contains non-usascii chars" 


    it "should encode multiple un bracketed addresses and groups correctly" 


    it "should correctly match and encode non-usascii letters at the end of a quoted string" 

  end

  describe "address encoding" do
    it "should not do anything to a plain address" 


    it "should encode an address correctly" 


    it "should encode multiple addresses correctly" 


    it "should encode unicode local part" 


    it "should encode emoji local part" 


    it "should handle a single ascii address correctly from a string" 


    it "should handle multiple ascii addresses correctly from a string" 


    it "should handle ascii addresses correctly as an array" 


    it "should ignore single nil" 


    it "should ignore nil in arrays" 

  end

  describe ".charset_encoder" do
    class CustomEncoder
      def encode(str, charset)
        String.new("#{str}-#{charset}")
      end
    end

    def with_encoder(encoder)
      old, Mail::Ruby19.charset_encoder = Mail::Ruby19.charset_encoder, encoder
      yield
    ensure
      Mail::Ruby19.charset_encoder = old
    end

    it "can use a custom encoder" 


    it "uses converter for params" 


    it "can convert ansi with best effort" 

  end

  describe ".collapse_adjacent_encodings" do
    def convert(from, to)
      expect(Mail::Encodings.collapse_adjacent_encodings(from)).to eq to
    end

    it "leaves blank intact" 


    it "leaves pure unencoded intact" 


    it "does not modify 1 encoded" 


    it "splits unencoded and encoded into separate parts" 


    it "splits adjacent encodings into separate parts" 

    
    it "splits adjacent encodings without unencoded into separate parts" 


    it "does not join encodings when separated by unencoded" 


    it "does not join different encodings" 

    
    it "does not keep the separator character between two different encodings" 

  end

  describe ".pick_encoding" do
    it "finds encoding" 


    it "uses binary for unfound" 

  end
end

