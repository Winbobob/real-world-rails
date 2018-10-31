# encoding: UTF-8

RSpec.describe OAuth2::Error do
  let(:subject) { described_class.new(response) }
  let(:response) do
    fake_response = double(
      'response',
      :status => 418,
      :headers => response_headers,
      :body => response_body
    )

    OAuth2::Response.new(fake_response)
  end

  let(:response_headers) { {'Content-Type' => 'application/json'} }
  let(:response_body) { {:text => 'Coffee brewing failed'}.to_json }

  it 'sets self to #error on the response object' 


  it 'sets the response object to #response on self' 


  describe 'attr_readers' do
    it 'has code' 


    it 'has description' 


    it 'has response' 

  end

  context 'when the response is parseable as a hash' do
    let(:response_body) { response_hash.to_json }
    let(:response_hash) { {:text => 'Coffee brewing failed'} }

    context 'when the response has an error and error_description' do
      before do
        response_hash[:error_description] = 'Short and stout'
        response_hash[:error] = 'i_am_a_teapot'
      end

      it 'prepends to the error message with a return character' 


      context 'when the response needs to be encoded' do
        let(:response_body) { MultiJson.encode(response_hash).force_encoding('ASCII-8BIT') }

        context 'with invalid characters present' do
          before do
            response_body.gsub!('stout', "\255 invalid \255")
          end

          it 'replaces them' 

        end

        context 'with undefined characters present' do
          before do
            response_hash[:error_description] << ": 'A magical voyage of tea 🍵'"
          end

          it 'replaces them' 

        end
      end

      context 'when the response is not an encodable thing' do
        let(:response_headers) { {'Content-Type' => 'who knows'} }
        let(:response_body) { {:text => 'Coffee brewing failed'} }

        before do
          expect(response_body).not_to respond_to(:encode)
          # i.e. a Ruby hash
        end

        it 'does not try to encode the message string' 

      end

      it 'sets the code attribute' 


      it 'sets the description attribute' 

    end

    context 'when there is no error description' do
      before do
        expect(response_hash).not_to have_key(:error)
        expect(response_hash).not_to have_key(:error_description)
      end

      it 'does not prepend anything to the message' 


      it 'does not set code' 


      it 'does not set description' 

    end
  end

  context 'when the response does not parse to a hash' do
    let(:response_headers) { {'Content-Type' => 'text/html'} }
    let(:response_body) { '<!DOCTYPE html><html><head>Hello, I am a teapot</head><body></body></html>' }

    before do
      expect(response.parsed).not_to be_a(Hash)
    end

    it 'does not do anything to the message' 


    it 'does not set code' 


    it 'does not set description' 

  end
end

