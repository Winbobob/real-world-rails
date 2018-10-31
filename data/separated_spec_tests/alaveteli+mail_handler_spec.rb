# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '../../../spec_helper')

def create_message_from(from_field)
  mail_data = load_file_fixture('incoming-request-plain.email')
  mail_data.gsub!('EMAIL_FROM', from_field)
  mail = MailHandler.mail_from_raw_email(mail_data)
end

describe 'when creating a mail object from raw data' do

  it "should be able to parse a large email without raising an exception" 


  it 'should correctly parse a multipart email with a linebreak in the boundary' 


  it "should not fail on invalid byte sequence in content-disposition header" 


  it 'should parse multiple to addresses with unqoted display names' 


  it 'should return nil for malformed To: and Cc: lines' 


  it 'should convert an iso8859 email to utf8' 


  it 'should not be confused by subject lines with malformed UTF-8 at the end' 



  it 'should handle a UTF-7 subject' 


  it 'should convert a Windows-1252 body mislabelled as ISO-8859-1 to UTF-8' 


  it 'should not error on a subject line with an encoding encoding not recognized by iconv' 


end

describe 'when asked for the from name' do

  it 'should return nil if there is a blank "From" field' 


  it 'should correctly return an encoded name from the from field' 


  it 'should get a name from a "From" field with a name and address' 


  it 'should return nil from a "From" field that is just a name'do
    mail = get_fixture_mail('track-response-webshield-bounce.email')
    expect(MailHandler.get_from_name(mail)).to eq(nil)
  end

end

describe 'when asked for the from address' do

  it 'should return nil if there is a blank "From" field' 


  it 'should correctly return an address from a mail that has an encoded name in the from field' 


  it 'should return nil if there is no address in the "From" field' 


  it 'should return the "From" email address if there is one' 


  it 'should get an address from a "From" field with a name and address' 

end

describe 'when asked for all the addresses a mail has been sent to' do

  it 'should return an array containing the envelope-to address and the to address, and the cc address if there is one' 


  it 'should only return unique values' 


  it 'should handle the absence of an envelope-to or cc field' 


  it 'should not return invalid addresses' 



end

describe 'when asked for auto_submitted' do

  it 'should return a string value for an email with an auto-submitted header' 


  it 'should return a nil value for an email with no auto-submitted header' 


end

describe 'when asked if there is an empty return path' do

  it 'should return true if there is an empty return-path specified' 


  it 'should return false if there is no return-path header' 


  it 'should return false if there is a return path address' 

end

describe 'when deriving a name, email and formatted address from a message from a line' do

  def should_render_from_address(from_line, expected_result)
    mail = create_message_from(from_line)
    name = MailHandler.get_from_name(mail)
    email = MailHandler.get_from_address(mail)
    address = MailHandler.address_from_name_and_email(name, email).to_s
    expect([name, email, address]).to eq(expected_result)
  end

  it 'should correctly render a name with quoted commas' 


  it 'should correctly reproduce a simple name and email that does not need quotes' 


  it 'should render an address with no name' 


  it 'should quote a name with a square bracked in it' 


  it 'should quote a name with an @ in it' 



  it 'should quote a name with quotes in it' 


end

describe 'when getting the content type of a mail part' do

  def expect_content_type(fixture_file, content_type)
    mail = get_fixture_mail(fixture_file)
    expect(MailHandler.get_content_type(mail)).to eq(content_type)
  end

  it 'should correctly return a type of "multipart/report"' 


  it 'should correctly return a type of "text/plain"' 


  it 'should correctly return a type of "multipart/mixed"' 


  it 'should correctly return the types in an example bounce report' 


end

describe 'when getting header strings' do

  def expect_header_string(fixture_file, header, header_string)
    mail = get_fixture_mail(fixture_file)
    expect(MailHandler.get_header_string(header, mail)).to eq(header_string)
  end

  it 'should return the contents of a "Subject" header' 


  it 'should return the contents of an "X-Failed-Recipients" header' 


  it 'should return the contents of an example "" header' 


end

describe "when parsing HTML mail" do
  it "should display UTF-8 characters in the plain text version correctly" 


end

describe "when getting the attachment text" do
  it "should not raise an error if the expansion of a zip file raises an error" 


  it 'extracts plain text as UTF-8 from a zip file' 


end

describe 'when getting attachment attributes' do

  it 'should handle an Outlook attachment with HTML generated from RTF' 


  it 'should handle an Outlook attachment with multiple attachments' 


  it 'should handle a UTF-7 mail' 


  it 'should handle a mail with a non-multipart part with no charset in the Content-Type header' 


  it 'should get two attachment parts from a multipart mail with text and html alternatives
    and an image' do
    mail = get_fixture_mail('quoted-subject-iso8859-1.email')
    attributes = MailHandler.get_attachment_attributes(mail)
    expect(attributes.size).to eq(2)
  end

  it 'should get one attachment from a multipart mail with text and HTML alternatives, which should be UTF-8' 


  it 'should get multiple attachments from a multipart mail with text and HTML alternatives, which should be UTF-8' 


  it 'should expand a mail attached as text' 


  it 'should handle a mail which causes Tmail to generate a blank header value' 


  it 'should ignore truncated TNEF attachment' 


  it 'should ignore anything beyond the final MIME boundary' 


  it 'should cope with a missing final MIME boundary' 


  it 'should ignore a TNEF attachment with no usable contents' 


  it 'should treat a document/pdf attachment as application/pdf' 


  it 'should produce a consistent set of url_part_numbers, content_types, within_rfc822_subjects
        and filenames from an example mail with lots of attachments' do
    mail = get_fixture_mail('many-attachments-date-header.email')
    attributes = MailHandler.get_attachment_attributes(mail)

    expected_attributes = [ { :content_type=>"text/plain",
                              :url_part_number=>1,
                              :within_rfc822_subject=>nil,
                              :filename=>nil},
                            { :content_type=>"text/plain",
                              :url_part_number=>2,
                              :within_rfc822_subject=>"Re: xxx",
                              :filename=>nil},
                            { :content_type=>"text/html",
                              :url_part_number=>4,
                              :within_rfc822_subject=>"example",
                              :filename=>nil},
                            { :content_type=>"image/gif", :url_part_number=>5,
                              :within_rfc822_subject=>"example",
                              :filename=>"image001.gif"},
                            { :content_type=>"application/vnd.ms-excel",
                              :url_part_number=>6,
                              :within_rfc822_subject=>"example",
                              :filename=>"particpant list.xls"},
                            { :content_type=>"text/plain",
                              :url_part_number=>7,
                              :within_rfc822_subject=>"RE: example",
                              :filename=>nil},
                            { :content_type=>"text/html",
                              :url_part_number=>9,
                              :within_rfc822_subject=>"As promised - Masterclass info (example)",
                              :filename=>nil},
                            { :content_type=>"image/gif",
                              :url_part_number=>10,
                              :within_rfc822_subject=>"As promised - Masterclass info (example)",
                              :filename=>"image001.gif"},
                            { :content_type=>"application/vnd.ms-word",
                              :url_part_number=>11,
                              :within_rfc822_subject=>"As promised - Masterclass info (example)",
                              :filename=>"Participant List.doc"},
                            { :content_type=>"application/vnd.ms-word",
                              :url_part_number=>12,
                              :within_rfc822_subject=>"As promised - Masterclass info (example)",
                              :filename=>"Information & Booking Form.doc"},
                            { :content_type=>"text/plain",
                              :url_part_number=>13,
                              :within_rfc822_subject=>"Re: As promised - info (example)",
                              :filename=>nil},
                            { :content_type=>"text/html",
                              :url_part_number=>15,
                              :within_rfc822_subject=>"Thank you from example",
                              :filename=>nil},
                            { :content_type=>"image/gif",
                              :url_part_number=>16,
                              :within_rfc822_subject=>"Thank you from example",
                              :filename=>"image001.gif"},
                            { :content_type=>"text/plain",
                              :url_part_number=>17,
                              :within_rfc822_subject=>"example - Meeting - Tuesday 2nd March",
                              :filename=>nil},
                            { :content_type=>"text/plain",
                              :url_part_number=>18,
                              :within_rfc822_subject=>"example - Help needed",
                              :filename=>nil},
                            { :content_type=>"application/pdf",
                              :url_part_number=>19,
                              :within_rfc822_subject=>"example - Help needed",
                              :filename=>"Information Pack.pdf"},
                            { :content_type=>"text/plain",
                              :url_part_number=>20,
                              :within_rfc822_subject=>"Re: As promised - info (example)",
                              :filename=>nil} ]

    attributes.each_with_index do |attr, index|
      attr.delete(:charset)
      attr.delete(:body)
      attr.delete(:hexdigest)
      expect(attr).to eq(expected_attributes[index])
    end
  end

end

describe 'when getting the address part from an address string' do

  it 'should handle non-ascii characters in the name input' 

end

