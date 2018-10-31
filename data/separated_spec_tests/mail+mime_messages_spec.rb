# encoding: utf-8
# frozen_string_literal: true
require 'spec_helper'

describe "MIME Emails" do

    describe "general helper methods" do

      it "should read a mime version from an email" 


      it "should return nil if the email has no mime version" 


      it "should read the content-transfer-encoding" 


      it "should read the content-description" 


      it "should return the content-type" 


      it "should return the charset" 


      it "should allow you to set the charset" 


      it "should return the main content-type" 


      it "should return the sub content-type" 


      it "should return the content-type parameters" 


      describe 'a multipart email (raw_email7.eml)' do
        let(:mail) { read_fixture('emails', 'mime_emails', 'raw_email7.eml') }
        it "should recognize a multipart email" 


        it "inspect_structure should return what is expected" 

      end

      it "should recognize a non multipart email" 


      it "should not report the email as :attachment?" 


      describe 'attachment_only_email.eml' do
        let(:mail) { read_fixture('emails', 'attachment_emails', 'attachment_only_email.eml') }
        it "should report the email as :attachment?" 

        it "inspect_structure should return what is expected" 

      end

      it "should recognize an attachment part" 


      it "should give how may (top level) parts there are" 


      describe 'a multipart/alternative mail (raw_email11.eml)' do
        let(:mail) { read_fixture('emails', 'mime_emails', 'raw_email11.eml') }
        it "should give the content_type of each part" 

        it "inspect_structure should return what is expected" 

      end

      it "should report the mail :has_attachments?" 


      it "should only split on exact boundary matches" 

    end

    describe "multipart emails" do
      it "should add a boundary if there is none defined and a part is added" 


      it "should not add a boundary for a message that is only an attachment" 

    end

    describe "multipart/alternative emails" do

      it "should know what its boundary is if it is a multipart document" 


      it "should return nil if there is no content-type defined" 


      it "should assign the text part and allow you to reference" 


      it "should convert strings assigned to the text part into Mail::Part objects with sensible defaults" 


      it "should not assign a nil text part" 


      it "should assign the html part and allow you to reference" 


      it "should convert strings assigned to the html part into Mail::Part objects with sensible defaults" 


      it "should not assign a nil html part" 


      it "should set default content type on assigned text and html parts" 


      it "should set default content type on declared text and html parts" 


      it "should not override content type" 


      it "should add the html part and text part" 


      it "should remove the html part and back out of multipart/alternative if set to nil" 


      it "should remove the text part and back out of multipart/alternative if set to nil" 


      it "should set the content type to multipart/alternative if you assign html and text parts" 


      it "should set the content type to multipart/alternative if you declare html and text parts" 


      it "should not set the content type to multipart/alternative if you declare an html part but not a text part" 


      it "should not set the content type to multipart/alternative if you declare a text part but not an html part" 


      it "should add the end boundary tag" 


      it "should not put message-ids into parts" 


      it "should create a multipart/alternative email through a block" 


      it "should detect an html_part in an existing email" 


      it "should detect a text_part in an existing email with plain text attachment" 


      it "should detect an html_part in a multi level mime email" 


      it "should only the first part on a stupidly overly complex email" 


    end

    describe "finding attachments" do

      it "should return an array of attachments" 


      it "should return an array of attachments" 


      Dir.glob(fixture_path('attachments', "test.*")).each do |test_attachment|
        # This spec fails for (most?) jpegs in 1.8.7
        next if test_attachment.end_with?('test.jpg') && RUBY_VERSION < '1.9'

        it "should find binary encoded attachments of type #{File.extname(test_attachment)}" 

      end
    end

    describe "adding a file attachment" do

      it "should set to multipart/mixed if a text part and you add an attachment" 


      it "should set to multipart/mixed if you add an attachment and then a text part" 


      it "should add a part given a filename" 


      it "should give the part the right content type" 


      it "should return attachment objects" 


      it "should be return an aray of attachments" 


      it "should return the filename of each attachment" 


      it "should return the type/subtype of each attachment" 


      it "should return the content of each attachment" 


      it "should allow you to send in file data instead of having to read it" 


      it "should support :mime_type option" 


      it "should be able to add a body before adding a file" 


      it "should allow you to add a body as text part if you have added a file" 


      it "should allow you to add a body as text part if you have added a file and not truncate after newlines - issue 208" 


      it "should not raise a warning if there is a charset defined and there are non ascii chars in the body" 



    end

end

