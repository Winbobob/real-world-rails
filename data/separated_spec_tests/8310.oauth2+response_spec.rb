RSpec.describe OAuth2::Response do
  let(:raw_response) { Faraday::Response.new(:status => status, :response_headers => headers, :body => body) }
  let(:status) { 200 }
  let(:headers) { {'foo' => 'bar'} }
  let(:body) { 'foo' }

  let(:subject) { described_class.new(raw_response) }

  describe '#initialize' do
    it 'returns the status, headers and body' 

  end

  describe '.register_parser' do
    let(:response) do
      double('response', :headers => {'Content-Type' => 'application/foo-bar'},
                         :status => 200,
                         :body => 'baz')
    end

    before do
      described_class.register_parser(:foobar, 'application/foo-bar') do |body|
        "foobar #{body}"
      end
    end

    it 'adds to the content types and parsers' 


    it 'is able to parse that content type automatically' 

  end

  describe '#content_type' do
    context 'when headers are blank' do
      let(:headers) { nil }

      it 'returns nil' 

    end

    context 'when content-type is not present' do
      let(:headers) { {'a fuzzy' => 'fuzzer'} }

      it 'returns empty string' 

    end

    context 'when content-type is present' do
      let(:headers) { {'Content-Type' => 'application/x-www-form-urlencoded'} }

      it 'returns the content type header contents' 

    end
  end

  describe '#parsed' do
    it 'parses application/x-www-form-urlencoded body' 


    it 'parses application/json body' 


    it 'parses alternative application/json extension bodies' 


    it 'parses application/vnd.collection+json body' 


    it 'parses application/vnd.api+json body' 


    it "doesn't try to parse other content-types" 


    it 'supports registered parsers with arity == 0; passing nothing' 


    it 'supports registered parsers with arity == 2; passing body and response' 


    it 'supports registered parsers with arity > 2; passing body and response' 


    it 'supports directly passed parsers' 

  end

  context 'with xml parser registration' do
    it 'tries to load multi_xml and use it' 


    it 'is able to parse xml' 


    it 'is able to parse application/xml' 

  end

  describe 'converting to json' do
    it 'does not blow up' 

  end
end

