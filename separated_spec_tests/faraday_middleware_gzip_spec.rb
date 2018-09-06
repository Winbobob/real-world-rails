require 'helper'
require 'faraday_middleware/gzip'

describe FaradayMiddleware::Gzip, :type => :response do
  require 'brotli' unless jruby?

  let(:middleware) {
    described_class.new(lambda { |env|
      Faraday::Response.new(env)
    })
  }

  context 'request' do
    it 'sets the Accept-Encoding request header' 


    it 'doesnt overwrite existing Accept-Encoding request header' 

  end

  context 'response' do
    let(:uncompressed_body) {
      "<html><head><title>Rspec</title></head><body>Hello, spec!</body></html>"
    }
    let(:gzipped_body) {
      io = StringIO.new
      gz = Zlib::GzipWriter.new(io)
      gz.write(uncompressed_body)
      gz.close
      res = io.string
      res.force_encoding('BINARY') if res.respond_to?(:force_encoding)
      res
    }
    let(:deflated_body) {
      Zlib::Deflate.deflate(uncompressed_body)
    }
    let(:raw_deflated_body) {
      z = Zlib::Deflate.new(Zlib::DEFAULT_COMPRESSION, -Zlib::MAX_WBITS)
      compressed_body = z.deflate(uncompressed_body, Zlib::FINISH)
      z.close
      compressed_body
    }
    let(:brotlied_body) {
      Brotli.deflate(uncompressed_body)
    }

    shared_examples 'compressed response' do
      it 'uncompresses the body' 


      it 'sets the Content-Length' 


      it 'removes the Content-Encoding' 

    end

    context 'gzipped response' do
      let(:body) { gzipped_body }
      let(:headers) { {'Content-Encoding' => 'gzip', 'Content-Length' => body.length} }

      it_behaves_like 'compressed response'
    end

    context 'deflated response' do
      let(:body) { deflated_body }
      let(:headers) { {'Content-Encoding' => 'deflate', 'Content-Length' => body.length} }

      it_behaves_like 'compressed response'
    end

    context 'raw deflated response' do
      let(:body) { raw_deflated_body }
      let(:headers) { {'Content-Encoding' => 'deflate', 'Content-Length' => body.length} }

      it_behaves_like 'compressed response'
    end

    context 'brotlied response' do
      let(:body) { brotlied_body }
      let(:headers) { {'Content-Encoding' => 'br', 'Content-Length' => body.length } }

      it_behaves_like 'compressed response'
    end unless jruby?

    context 'identity response' do
      let(:body) { uncompressed_body }

      it 'does not modify the body' 

    end
  end
end

