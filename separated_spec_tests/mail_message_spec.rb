# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe Mail::Message do

  def basic_email
    "To: mikel\r\nFrom: bob\r\nSubject: Hello!\r\n\r\nemail message\r\n"
  end

  describe "initialization" do

    it "should instantiate empty" 


    it "should return a basic email" 


    it "should instantiate with a string" 


    it "should allow us to pass it a block" 


    it "should yield self if the given block takes any args" 


    it "should initialize a body and header class even if called with nothing to begin with" 


    it "should not report basic emails as bounced" 


    it "should be able to parse a basic email" 


    it "should be able to parse a basic email with linefeeds" 


    it "should be able to parse an email with @ in display name" 


    it "should be able to parse an email with only blank lines as body" 


    it "should be able to parse an email with a funky date header" 


    it 'should be able to invoke subject on a funky subject header' 


    it 'should use default charset' 


    it 'should be able to parse an email missing an encoding' 


    Dir.glob(fixture_path('emails/**/*.eml')).each do |path|
      it "parses #{path} fixture" 

    end

    it "should be able to parse a large email without raising an exception" 


    it "should not raise a warning on having non US-ASCII characters in the header (should just handle it)" 


    it "should raise a warning (and keep parsing) on having an incorrectly formatted header" 


    it "should read in an email message and basically parse it" 


    it "should not fail parsing message with caps in content_type" 


    it "should be able to pass an empty reply-to header" 


    it "should be able to pass two In-Reply-To headers" 


    it "should be able to pass two References headers" 


    describe "YAML serialization" do
      before(:each) do
        # Ensure specs don't randomly fail due to messages being generated 1 second apart
        time = DateTime.now
        allow(DateTime).to receive(:now).and_return(time)

        @yaml_mail = Mail::Message.new(:to => 'someone@somewhere.com',
                                  :cc => 'someoneelse@somewhere.com',
                                  :bcc => 'someonesecret@somewhere.com',
                                  :body => 'body',
                                  :subject => 'subject')
        @smtp_settings = { :address=>"smtp.somewhere.net",
          :port=>"587", :domain=>"somewhere.net", :user_name=>"someone@somewhere.net",
          :password=>"password", :authentication=>:plain, :enable_starttls_auto => true,
          :enable_starttls => nil, :openssl_verify_mode => nil, :ssl=>nil, :tls=>nil, :open_timeout=>nil, :read_timeout=>nil }
        @yaml_mail.delivery_method :smtp, @smtp_settings
      end

      it "should serialize the basic information to YAML" 


      it "should deserialize after serializing" 


      it "should serialize a Message with a custom delivery_handler" 


      it "should load a serialized delivery handler" 


      it "should not deserialize a delivery_handler that does not exist" 


      it "should handle multipart mail" 

    end

    describe "splitting" do
      it "should split the body from the header" 


      it "should split when the body starts with a space" 


      it "should split if the body starts with an empty line" 


      it "should split if the body starts with a blank line" 


      it 'should split after headers that contain "\r\n "' 


      it 'should split only once if there are "\r\n\r\n"s in the body' 


      it "should allow headers that end in trailing whitespace" 

    end
  end

  describe "envelope line handling" do
    it "should respond to 'envelope from'" 


    it "should strip off the envelope from field if present" 


    it "should strip off the envelope from field if present" 


    it "should not cause any problems if there is no envelope from present" 


    it "should ignore a plain text body that starts with ^From" 


    it "should handle a multipart message that has ^From in it" 


  end

  describe "accepting a plain text string email" do

    it "should accept some email text to parse and return an email" 


    it "should set a raw source instance variable to equal the passed in message" 


    it "should set the raw source instance variable to '' if no message is passed in" 


    it "should give the header class the header to parse" 


    it "should give the header class the header to parse even if there is no body" 


    it "should give the body class the body to parse" 


    it "should still ask the body for a new instance even though these is nothing to parse, yet" 


    it "should give the header the part before the line without spaces and the body the part without" 


    it "should allow for whitespace at the start of the email" 


    it "should read in an email message with the word 'From' in it multiple times and parse it" 


    it "should parse non-UTF8 sources" 


    it "should parse sources with charsets that we know but Ruby doesn't" 


    if '1.9+'.respond_to?(:encoding)
      it "should be able to normalize CRLFs on non-UTF8 encodings" 

    end

    if '1.9+'.respond_to?(:encoding)
      it "should be able to normalize CRLFs on non-UTF8 encodings" 

    end
  end

  describe "directly setting values of a message" do

    describe "accessing fields directly" do

      before(:each) do
        @mail = Mail::Message.new
      end

      it "should allow you to grab field objects if you really want to" 


      it "should give you back the fields in the header" 


      it "should delete a field if it is set to nil" 


    end

    describe "with :method=" do

      before(:each) do
        @mail = Mail::Message.new
      end

      it "should return the to field" 


      it "should return the from field" 


      it "should return the subject" 


      it "should return the body decoded with to_s" 


      it "should return the body encoded if asked for" 


      it "should return the body decoded if asked for" 

    end

    describe "with :method(value)" do

      before(:each) do
        @mail = Mail::Message.new
      end

      it "should return the to field" 


      it "should return the from field" 


      it "should return the subject" 


      it "should return the body decoded with to_s" 


      it "should return the body encoded if asked for" 


      it "should return the body decoded if asked for" 

    end

    describe "setting arbitrary headers" do

      before(:each) do
        @mail = Mail::Message.new
      end

      it "should allow you to set them" 


      it "should allow you to read arbitrary headers" 


      it "should instantiate a new Header" 

    end

    describe "replacing header values" do

      it "should allow you to replace a from field" 


      it "should maintain the class of the field" 

    end

    describe "setting headers" do

      it "should accept them in block form" 


      it "should accept them in assignment form" 


      it "should accept them in key, value form as symbols" 


      it "should accept them in key, value form as strings" 


      it "should accept them as a hash with symbols" 


      it "should accept them as a hash with strings" 


      it "should let you set custom headers with a :headers => {hash}" 


      it "should assign the body to a part on creation" 


      it "should not overwrite bodies on creation" 


      it "should allow you to init on an array of addresses from a hash" 


      it "should allow you to init on an array of addresses directly" 


      it "should allow you to init on an array of addresses directly" 


    end

  end

  describe "making a copy of a message with dup" do
    def message_should_have_default_values(message)
      expect(message.bcc).to           be_nil
      expect(message.cc).to            be_nil
      expect(message.comments).to      be_nil
      expect(message.date).to          be_nil
      expect(message.from).to          be_nil
      expect(message.in_reply_to).to   be_nil
      expect(message.keywords).to      be_nil
      expect(message.message_id).to    be_nil
      expect(message.received).to      be_nil
      expect(message.references).to    be_nil
      expect(message.reply_to).to      be_nil
      expect(message.resent_bcc).to    be_nil
      expect(message.resent_cc).to     be_nil
      expect(message.resent_date).to   be_nil
      expect(message.resent_from).to   be_nil
      expect(message.resent_message_id).to be_nil
      expect(message.resent_sender).to be_nil
      expect(message.resent_to).to     be_nil
      expect(message.sender).to        be_nil
      expect(message.subject).to       be_nil
      expect(message.to).to            be_nil
      expect(message.content_type).to              be_nil
      expect(message.content_transfer_encoding).to be_nil
      expect(message.content_description).to       be_nil
      expect(message.content_disposition).to       be_nil
      expect(message.content_id).to                be_nil
      expect(message.mime_version).to              be_nil
      expect(message.body.to_s).to          eq ''
    end

    it "its headers should not be changed when you change the headers of the original" 


    def message_headers_should_match(message, other)
      expect(message.bcc).to           eq other.bcc
      expect(message.cc).to            eq other.cc
      expect(message.comments).to      eq other.comments
      expect(message.date).to          eq other.date
      expect(message.from).to          eq other.from
      expect(message.in_reply_to).to   eq other.in_reply_to
      expect(message.keywords).to      eq other.keywords
      expect(message.message_id).to    eq other.message_id
      expect(message.received).to      eq other.received
      expect(message.references).to    eq other.references
      expect(message.reply_to).to      eq other.reply_to
      expect(message.resent_bcc).to    eq other.resent_bcc
      expect(message.resent_cc).to     eq other.resent_cc
      expect(message.resent_date).to   eq other.resent_date
      expect(message.resent_from).to   eq other.resent_from
      expect(message.resent_message_id).to eq other.resent_message_id
      expect(message.resent_sender).to eq other.resent_sender
      expect(message.resent_to).to     eq other.resent_to
      expect(message.sender).to        eq other.sender
      expect(message.subject).to       eq other.subject
      expect(message.to).to            eq other.to
      expect(message.content_type).to              eq other.content_type
      expect(message.content_transfer_encoding).to eq other.content_transfer_encoding
      expect(message.content_description).to       eq other.content_description
      expect(message.content_disposition).to       eq other.content_disposition
      expect(message.content_id).to                eq other.content_id
      expect(message.mime_version).to              eq other.mime_version
      expect(message.body.to_s).to          eq other.body.to_s
    end

    it "its headers should be copies of the headers of the original" 

  end

  describe "handling missing required fields:" do

    describe "every email" do

      describe "Message-ID" do
        it "should say if it has a message id" 


        it "should preserve any message id that you pass it if add_message_id is called explicitly" 


        it "should generate a random message ID if nothing is passed to add_message_id" 


        it "should make an email and inject a message ID if none was set if told to_s" 


        it "should add the message id to the message permanently once sent to_s" 


        it "should add a body part if it is missing" 

      end

      describe "Date" do
        it "should say if it has a date" 


        it "should preserve any date that you pass it if add_date is called explicitly" 


        it "should generate a current date if nothing is passed to add_date" 


        it "should make an email and inject a date if none was set if told to_s" 


        it "should add the date to the message permanently once sent to_s" 

      end

    end

    describe "mime emails" do

      describe "mime-version" do
        it "should say if it has a mime-version" 


        it "should preserve any mime version that you pass it if add_mime_version is called explicitly" 


        it "should generate a mime version if nothing is passed to add_date" 


        it "should make an email and inject a mime_version if none was set if told to_s" 


        it "should add the mime version to the message permanently once sent to_s" 

      end

      describe "content type" do

        it "should say if it has a content type" 


        it "should say if it does not have a content type" 


        it "should say if it has a charset" 


        it "should say if it has a charset" 


        it "should not raise a warning if there is no charset defined and only US-ASCII chars" 


        it "should set the content type to text/plain; charset=us-ascii" 


        it "should not set the charset if the file is an attachment" 


        it "should not set the charset if the content_type is not text" 


        it "should raise a warning if there is no content type and there is non ascii chars and default to text/plain, UTF-8" 


        it "should raise a warning if there is no charset parameter and there is non ascii chars and default to text/plain, UTF-8" 


        it "should not raise a warning if there is no charset parameter and the content-type is not text" 


        it "should not raise a warning if there is a charset defined and there is non ascii chars" 


        it "should be able to set a content type with an array and hash" 


        it "should be able to set a content type with an array and hash with a non-usascii field" 


        it "should allow us to specify a content type in a block" 


      end

      it "rfc2046 can be decoded" 


      # https://www.ietf.org/rfc/rfc2046.txt
      # No encoding other than "7bit", "8bit", or "binary" is permitted for
      # the body of a "message/rfc822" entity.
      it "rfc2046" 


      describe "convert_to_multipart" do
        subject do
          read_fixture('emails', 'attachment_emails', 'attachment_only_email.eml').tap(&:convert_to_multipart)
        end

        it "original content headers move to the new part" 

      end

      describe "content-transfer-encoding" do

        it "should use 7bit for only US-ASCII chars" 


        it "should use QP transfer encoding for 7bit text with lines longer than 998 octets" 


        it "should use QP transfer encoding for 8bit text with only a few 8bit characters" 


        it "should use base64 transfer encoding for 8-bit text with lots of 8bit characters" 


        it "should not use 8bit transfer encoding when 8bit is allowed" 


      end

    end

  end

  describe "output" do

    it "should make an email and allow you to call :to_s on it to get a string" 


    it "should raise an error and message if you try and call decoded on a multipart email" 


    it "should return the decoded body if you call decode and the message is not multipart" 


    describe "decoding bodies" do

      it "should not change a body on decode if not given an encoding type to decode" 


      it "should change a body on decode if given an encoding type to decode" 


      it "should change a body on decode if given an encoding type to decode" 


      it 'should not strip the raw mail source in case the trailing \r\n is meaningful' 


    end

  end

  describe "text messages" do
    def message_with_iso_8859_1_charset
      "From: test@example.com\r\n"+
      "Content-Type: text/plain; charset=iso-8859-1\r\n"+
      "Content-Transfer-Encoding: quoted-printable\r\n"+
      "Date: Tue, 27 Sep 2011 16:59:48 +0100 (BST)\r\n"+
      "Subject: test\r\n\r\n"+
      "Am=E9rica"
    end

    def with_encoder(encoder)
      old, Mail::Ruby19.charset_encoder = Mail::Ruby19.charset_encoder, encoder
      yield
    ensure
      Mail::Ruby19.charset_encoder = old
    end

    let(:message){
      Mail.new(message_with_iso_8859_1_charset)
    }

    it "should be decoded using content type charset" 


    it "should respond true to text?" 


    it "inspect_structure should return the same as inspect (no attachments)" 


    if RUBY_VERSION > "1.9"
      it "uses the Ruby19 charset encoder" 

    end
  end

  describe "helper methods" do

    describe "==" do
      before(:each) do
        # Ensure specs don't randomly fail due to messages being generated 1 second apart
        time = DateTime.now
        expect(DateTime).to receive(:now).at_least(:once).and_return(time)
      end

      it "should be implemented" 


      it "should ignore the message id value if both have a nil message id" 


      it "should ignore the message id value if self has a nil message id" 


      it "should ignore the message id value if other has a nil message id" 


      it "should not be == if both emails have different Message IDs" 

    end

    it "should implement the spaceship operator on the date field" 


    it "should have a destinations method" 


    it "should have a from_addrs method" 


    it "should have a from_addrs method that is empty if nil" 


    it "should have a to_addrs method" 


    it "should have a to_addrs method that is empty if nil" 


    it "should have a cc_addrs method" 


    it "should have a cc_addrs method that is empty if nil" 


    it "should have a bcc_addrs method" 


    it "should have a bcc_addrs method that is empty if nil" 


    it "should give destinations even if some of the fields are blank" 


    it "should be able to encode with only one destination" 


  end

  describe "nested parts" do
    it "adds a new text part when assigning the body on an already-multipart message" 


    it "should provide a way to instantiate a new part as you go down" 

  end

  describe "deliver" do
    it "should return self after delivery" 


    class DeliveryAgent
      def self.deliver_mail(mail)
      end
    end

    it "should pass self to a delivery agent" 


    class ObserverAgent
      def self.delivered_email(mail)
      end
    end

    it "should inform observers that the mail was sent" 


    it "should allow observers to be unregistered" 


    it "should inform observers that the mail was sent, even if a delivery agent is used" 


    class InterceptorAgent
      @@intercept = false
      def self.intercept=(val)
        @@intercept = val
      end
      def self.delivering_email(mail)
        if @@intercept
          mail.to = 'bob@example.com'
        end
      end
    end

    it "should pass to the interceptor the email just before it gets sent" 


    it "should let the interceptor that the mail was sent" 


    it "should allow interceptors to be unregistered" 


  end

  describe "error handling" do
    it "should collect up any of its fields' errors" 

  end

  describe "header case should be preserved" do
    it "should handle mail[] and keep the header case" 

  end

  describe "parsing emails with non usascii in the header" do
    it "should work" 

  end

  describe "ordering messages" do
    it "should put all attachments as the last item" 


    it "should allow overwriting sort order" 

  end

  describe "attachment query methods" do
    it "shouldn't die with an invalid Content-Disposition header" 


    it "shouldn't die with an invalid Content-Type header" 


  end

  describe "without_attachments!" do
    it "should delete all attachments" 

  end

  describe "replying" do

    describe "to a basic message" do

      before do
        @mail = read_fixture('emails', 'plain_emails', 'basic_email.eml')
      end

      it "should create a new message" 


      it "should be in-reply-to the original message" 


      it "should reference the original message" 


      it "should Re: the original subject" 


      it "should be sent to the original sender" 


      it "should be sent from the original recipient" 


      it "should accept args" 


      it "should accept a block" 


    end

    describe "to a message with an explicit reply-to address" do

      before do
        @mail = read_fixture('emails', 'rfc2822', 'example06.eml')
      end

      it "should be sent to the reply-to address" 


    end

    describe "to a message with more than one recipient" do

      before do
        @mail = read_fixture('emails', 'rfc2822', 'example03.eml')
      end

      it "should be sent from the first to address" 


    end

    describe "to a reply" do

      before do
        @mail = read_fixture('emails', 'plain_emails', 'raw_email_reply.eml')
      end

      it "should be in-reply-to the original message" 


      it "should append to the original's references list" 


      it "should not append another Re:" 


    end

    describe "to a reply with an in-reply-to with a single message id but no references header" do

      before do
        @mail = Mail.new do
          in_reply_to '<1234@test.lindsaar.net>'
          message_id '5678@test.lindsaar.net'
        end
      end

      it "should have a references consisting of the in-reply-to and message_id fields" 


    end

    describe "to a reply with an in-reply-to with multiple message ids but no references header" do

      before do
        @mail = Mail.new do
          in_reply_to '<1234@test.lindsaar.net> <5678@test.lindsaar.net>'
          message_id '90@test.lindsaar.net'
        end
      end

      # Behavior is actually not defined in RFC2822, so we'll just leave it empty
      it "should have no references header" 


    end

  end

  describe 'SMTP envelope From' do
    it 'should respond' 


    it 'should default to return_path, sender, or first from address' 


    it 'can be overridden' 

  end

  describe 'SMTP envelope To' do
    it 'should respond' 


    it 'should default to destinations' 


    it 'can be overridden' 

  end

end

