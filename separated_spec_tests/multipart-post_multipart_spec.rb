#--
# Copyright (c) 2007-2013 Nick Sieger.
# See the file README.txt included with the distribution for
# software license details.
#++

require 'net/http/post/multipart'

RSpec.shared_context "net http multipart" do
  let(:temp_file) {"temp.txt"}
  let(:http_post) do
    Struct.new("HTTPPost", :content_length, :body_stream, :content_type) do
      def set_content_type(type, params = {})
        self.content_type = type + params.map{|k,v|"; #{k}=#{v}"}.join('')
      end
    end
  end
  
  after(:each) do
    File.delete(temp_file) rescue nil
  end
  
  def assert_results(post)
    expect(post.content_length).to be > 0
    expect(post.body_stream).to_not be_nil
    
    expect(post['content-type']).to be == "multipart/form-data; boundary=#{Multipartable::DEFAULT_BOUNDARY}"
    
    body = post.body_stream.read
    boundary_regex = Regexp.quote Multipartable::DEFAULT_BOUNDARY
    
    expect(body).to be =~ /1234567890/
    
    # ensure there is at least one boundary
    expect(body).to be =~ /^--#{boundary_regex}\r\n/
    
    # ensure there is an epilogue
    expect(body).to be =~ /^--#{boundary_regex}--\r\n/
    expect(body).to be =~ /text\/plain/
    
    if (body =~ /multivalueParam/)
      expect(body.scan(/^.*multivalueParam.*$/).size).to be == 2
    end
  end

  def assert_additional_headers_added(post, parts_headers)
    post.body_stream.rewind
    body = post.body_stream.read
    parts_headers.each do |part, headers|
      headers.each do |k,v|
        expect(body).to be =~ /#{k}: #{v}/
      end
    end
  end
end

RSpec.describe Net::HTTP::Post::Multipart do
  include_context "net http multipart"
  
  it "test_form_multipart_body" 


  it "test_form_multipart_body_with_stringio" 


  it "test_form_multiparty_body_with_parts_headers" 


  it "test_form_multipart_body_with_array_value" 


  it "test_form_multipart_body_with_arrayparam" 

end

RSpec.describe Net::HTTP::Put::Multipart do
  include_context "net http multipart"
  
  it "test_form_multipart_body_put" 

end

