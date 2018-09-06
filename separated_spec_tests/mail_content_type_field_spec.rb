# frozen_string_literal: true
require 'spec_helper'

describe Mail::ContentTypeField do
  # Content-Type Header Field
  #
  # The purpose of the Content-Type field is to describe the data
  # contained in the body fully enough that the receiving user agent can
  # pick an appropriate agent or mechanism to present the data to the
  # user, or otherwise deal with the data in an appropriate manner. The
  # value in this field is called a media type.
  #
  # HISTORICAL NOTE:  The Content-Type header field was first defined in
  # RFC 1049.  RFC 1049 used a simpler and less powerful syntax, but one
  # that is largely compatible with the mechanism given here.
  #
  # The Content-Type header field specifies the nature of the data in the
  # body of an entity by giving media type and subtype identifiers, and
  # by providing auxiliary information that may be required for certain
  # media types.  After the media type and subtype names, the remainder
  # of the header field is simply a set of parameters, specified in an
  # attribute=value notation.  The ordering of parameters is not
  # significant.
  #
  # In general, the top-level media type is used to declare the general
  # type of data, while the subtype specifies a specific format for that
  # type of data.  Thus, a media type of "image/xyz" is enough to tell a
  # user agent that the data is an image, even if the user agent has no
  # knowledge of the specific image format "xyz".  Such information can
  # be used, for example, to decide whether or not to show a user the raw
  # data from an unrecognized subtype -- such an action might be
  # reasonable for unrecognized subtypes of text, but not for
  # unrecognized subtypes of image or audio.  For this reason, registered
  # subtypes of text, image, audio, and video should not contain embedded
  # information that is really of a different type.  Such compound
  # formats should be represented using the "multipart" or "application"
  # types.
  #
  # Parameters are modifiers of the media subtype, and as such do not
  # fundamentally affect the nature of the content.  The set of
  # meaningful parameters depends on the media type and subtype.  Most
  # parameters are associated with a single specific subtype.  However, a
  # given top-level media type may define parameters which are applicable
  # to any subtype of that type.  Parameters may be required by their
  # defining content type or subtype or they may be optional. MIME
  # implementations must ignore any parameters whose names they do not
  # recognize.
  #
  # For example, the "charset" parameter is applicable to any subtype of
  # "text", while the "boundary" parameter is required for any subtype of
  # the "multipart" media type.
  #
  # There are NO globally-meaningful parameters that apply to all media
  # types.  Truly global mechanisms are best addressed, in the MIME
  # model, by the definition of additional Content-* header fields.
  #
  # An initial set of seven top-level media types is defined in RFC 2046.
  # Five of these are discrete types whose content is essentially opaque
  # as far as MIME processing is concerned.  The remaining two are
  # composite types whose contents require additional handling by MIME
  # processors.
  #
  # This set of top-level media types is intended to be substantially
  # complete.  It is expected that additions to the larger set of
  # supported types can generally be accomplished by the creation of new
  # subtypes of these initial types.  In the future, more top-level types
  # may be defined only by a standards-track extension to this standard.
  # If another top-level type is to be used for any reason, it must be
  # given a name starting with "X-" to indicate its non-standard status
  # and to avoid a potential conflict with a future official name.
  #
  describe "initialization" do

    it "should initialize" 


    it "should accept a string without the field name" 


    it "should accept a nil value and generate a content_type" 


    it "should render encoded" 


    it "should render encoded with parameters" 


    it "should render quoted values encoded" 


    it "should render decoded" 


    it "should render quoted values decoded" 


    it "should render " 


    it "should wrap a filename in double quotation marks only if the filename contains spaces and does not already have double quotation marks" 


    it "should only wrap filenames in double quotation marks" 

  end

  describe "instance methods" do
    it "should return a content_type" 


    it "should return a content_type for the :string method" 


    it "should return a main_type" 


    it "should return a sub_type" 


    it "should return a parameter as a hash" 


    it "should return multiple parameters as a hash" 


    it "should return boundry parameters" 


    it "should be indifferent with the access" 


  end

  describe "class methods" do
    it "should give back an initialized instance with a unique boundary" 


    it "should give back an initialized instance with different type with a unique boundary" 


    it "should give unique boundaries" 


  end

  describe "Testing a bunch of email Content-Type fields" do

    it "should handle 'application/octet-stream; name*=iso-2022-jp'ja'01%20Quien%20Te%20Dij%8aat.%20Pitbull.mp3'" 


    it "should handle 'application/pdf;'" 


    it "should handle 'application/pdf; name=\"broken.pdf\"'" 


    it "should handle 'application/pkcs7-signature;'" 


    it "should handle 'application/pkcs7-signature; name=smime.p7s'" 


    it "should handle 'application/x-gzip; NAME=blah.gz'" 


    it "should handle 'image/jpeg'" 


    it "should handle 'image/jpeg'" 


    it "should handle 'image/jpeg;'" 


    it "should handle 'image/png;'" 


    it "should handle 'message/delivery-status'" 


    it "should handle 'message/rfc822'" 


    it "should handle 'multipart/alternative;'" 


    it "should handle 'multipart/alternative; boundary=\"----=_NextPart_000_0093_01C81419.EB75E850\"'" 


    it "should handle 'multipart/alternative; boundary=----=_NextPart_000_0093_01C81419.EB75E850'" 


    it "should handle 'Multipart/Alternative;boundary=MuLtIpArT_BoUnDaRy'" 


    it "should handle 'Multipart/Alternative;boundary=MuLtIpArT_BoUnDaRy'" 


    it %(should handle 'multipart/alternative; boundary="----jkhkjgyurlkmn789809";; charset="us-ascii"') do
      string = %(multipart/alternative; boundary="----jkhkjgyurlkmn789809";; charset="us-ascii")
      c = Mail::ContentTypeField.new(string)
      expect(c.content_type).to eq 'multipart/alternative'
      expect(c.parameters['boundary']).to eq('----jkhkjgyurlkmn789809')
    end

    it "should handle 'multipart/mixed'" 


    it "should handle 'multipart/mixed;'" 


    it "should handle 'multipart/mixed; boundary=Apple-Mail-13-196941151'" 


    it "should handle 'multipart/mixed; boundary=mimepart_427e4cb4ca329_133ae40413c81ef'" 


    it "should handle 'multipart/report; report-type=delivery-status;'" 


    it "should handle 'multipart/signed;'" 


    it "should handle 'text/enriched;'" 


    it "should handle 'text/html;'" 


    it "should handle 'text/html; charset=iso-8859-1;'" 


    it "should handle 'TEXT/PLAIN; charset=ISO-8859-1;'" 


    it "should handle 'text/plain'" 


    it "should handle 'text/plain;'" 


    it "should handle 'text/plain; charset=ISO-8859-1'" 


    it "should handle 'text/plain; charset=ISO-8859-1;'" 


    it "should handle 'text/plain; charset=us-ascii;'" 


    it "should handle 'text/plain; charset=US-ASCII; format=flowed'" 


    it "should handle 'text/plain; charset=US-ASCII; format=flowed'" 


    it "should handle 'text/plain; charset=utf-8'" 


    it "should handle 'text/plain; charset=utf-8'" 


    it "should handle 'text/x-ruby-script;'" 


    it "should handle 'text/x-ruby-script; name=\"hello.rb\"'" 


    it "should handle 'multipart/mixed; boundary=\"=_NextPart_Lycos_15031600484464_ID\"" 


    it "should handle 'multipart/mixed; boundary=\"=_NextPart_2rfkindysadvnqw3nerasdf\";windows-852" 


    it "should handle 'multipart/alternative; boundary=----=_=NextPart_000_0093_01C81419.EB75E850" 


    it "should handle 'multipart/alternative; boundary=\"----=_=NextPart_000_0093_01C81419.EB75E850\"" 


    it "should handle 'multipart/related;boundary=1_4626B816_9F1690;Type=\"application/smil\";Start=\"<mms.smil.txt>\"'" 


    it "should handle 'IMAGE/JPEG; name=\"IM 006.jpg\"'" 


    it "should handle 'unknown/unknown'" 


  end

  describe "finding a filename" do

    it "should locate a filename if there is a filename" 


    it "should locate a name if there is no filename" 


    it "should return an empty string when filename or name is empty" 


    it "should locate an encoded name as a filename" 


    it "should encode a non us-ascii filename" 


  end

  describe "handling badly formated content-type fields" do

    it "should handle missing sub-type on a text content type" 


    it "should handle missing ; after content-type" 


  end

  describe "initializing with an array" do
    it "should initialize with an array" 


    it "should allow many parameters to be passed in" 

  end

  describe "special case values needing sanity" do
    it "should handle 'text/plain;ISO-8559-1'" 


    it "should handle 'text/plain; charset = \"iso-8859-1\"'" 


    it "should handle text; params" 


    it 'should handle text/html; charset="charset="GB2312""' 


    it "should handle application/octet-stream; name=archiveshelp1[1].htm" 


    it 'should handle text/plain;; format="flowed"' 


    it 'set an empty content type to text/plain' 


    it "should just ignore illegal params like audio/x-midi;\r\n\sname=Part .exe" 


    it "should handle: rfc822; format=flowed; charset=iso-8859-15" 


    it "should just get the mime type if all else fails with some real garbage" 


    it "shouldn't include separating semicolon in parameter value when sanitizing" 


  end

end

