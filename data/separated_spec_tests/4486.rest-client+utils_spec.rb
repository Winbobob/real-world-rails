require_relative '_lib'

describe RestClient::Utils do
  describe '.get_encoding_from_headers' do
    it 'assumes no encoding by default for text' 


    it 'returns nil on failures' 


    it 'handles various charsets' 

  end

  describe '.cgi_parse_header' do
    it 'parses headers', :unless => RUBY_VERSION.start_with?('2.0') do
      expect(RestClient::Utils.cgi_parse_header('text/plain')).
        to eq ['text/plain', {}]

      expect(RestClient::Utils.cgi_parse_header('text/vnd.just.made.this.up')).
        to eq ['text/vnd.just.made.this.up', {}]

      expect(RestClient::Utils.cgi_parse_header('text/plain;charset=us-ascii')).
        to eq ['text/plain', {'charset' => 'us-ascii'}]

      expect(RestClient::Utils.cgi_parse_header('text/plain ; charset="us-ascii"')).
        to eq ['text/plain', {'charset' => 'us-ascii'}]

      expect(RestClient::Utils.cgi_parse_header(
        'text/plain ; charset="us-ascii"; another=opt')).
        to eq ['text/plain', {'charset' => 'us-ascii', 'another' => 'opt'}]

      expect(RestClient::Utils.cgi_parse_header(
        'foo/bar; filename="silly.txt"')).
        to eq ['foo/bar', {'filename' => 'silly.txt'}]

      expect(RestClient::Utils.cgi_parse_header(
        'foo/bar; filename="strange;name"')).
        to eq ['foo/bar', {'filename' => 'strange;name'}]

      expect(RestClient::Utils.cgi_parse_header(
        'foo/bar; filename="strange;name";size=123')).to eq \
        ['foo/bar', {'filename' => 'strange;name', 'size' => '123'}]

      expect(RestClient::Utils.cgi_parse_header(
        'foo/bar; name="files"; filename="fo\\"o;bar"')).to eq \
        ['foo/bar', {'name' => 'files', 'filename' => 'fo"o;bar'}]
    end
  end

  describe '.encode_query_string' do
    it 'handles simple hashes' 


    it 'handles simple arrays' 


    it 'handles nested hashes' 


    it 'handles null and empty values' 


    it 'handles nested nulls' 


    it 'handles deep nesting' 


    it 'handles multiple fields with the same name using ParamsArray' 


    it 'handles nested ParamsArrays' 

  end
end

