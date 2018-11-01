require 'rails_helper'

RSpec.describe FetchLinkCardService, type: :service do
  subject { FetchLinkCardService.new }

  before do
    stub_request(:head, 'http://example.xn--fiqs8s/').to_return(status: 200, headers: { 'Content-Type' => 'text/html' })
    stub_request(:get, 'http://example.xn--fiqs8s/').to_return(request_fixture('idn.txt'))
    stub_request(:head, 'http://example.com/sjis').to_return(status: 200, headers: { 'Content-Type' => 'text/html' })
    stub_request(:get, 'http://example.com/sjis').to_return(request_fixture('sjis.txt'))
    stub_request(:head, 'http://example.com/sjis_with_wrong_charset').to_return(status: 200, headers: { 'Content-Type' => 'text/html' })
    stub_request(:get, 'http://example.com/sjis_with_wrong_charset').to_return(request_fixture('sjis_with_wrong_charset.txt'))
    stub_request(:head, 'http://example.com/koi8-r').to_return(status: 200, headers: { 'Content-Type' => 'text/html' })
    stub_request(:get, 'http://example.com/koi8-r').to_return(request_fixture('koi8-r.txt'))
    stub_request(:head, 'http://example.com/日本語').to_return(status: 200, headers: { 'Content-Type' => 'text/html' })
    stub_request(:get, 'http://example.com/日本語').to_return(request_fixture('sjis.txt'))
    stub_request(:head, 'https://github.com/qbi/WannaCry').to_return(status: 404)
    stub_request(:head, 'http://example.com/test-').to_return(status: 200, headers: { 'Content-Type' => 'text/html' })
    stub_request(:get, 'http://example.com/test-').to_return(request_fixture('idn.txt'))

    subject.call(status)
  end

  context 'in a local status' do
    context do
      let(:status) { Fabricate(:status, text: 'Check out http://example.中国') }

      it 'works with IDN URLs' 

    end

    context do
      let(:status) { Fabricate(:status, text: 'Check out http://example.com/sjis') }

      it 'works with SJIS' 

    end

    context do
      let(:status) { Fabricate(:status, text: 'Check out http://example.com/sjis_with_wrong_charset') }

      it 'works with SJIS even with wrong charset header' 

    end

    context do
      let(:status) { Fabricate(:status, text: 'Check out http://example.com/koi8-r') }

      it 'works with koi8-r' 

    end

    context do
      let(:status) { Fabricate(:status, text: 'テストhttp://example.com/日本語') }

      it 'works with Japanese path string' 

    end

    context do
      let(:status) { Fabricate(:status, text: 'test http://example.com/test-') }

      it 'works with a URL ending with a hyphen' 

    end
  end

  context 'in a remote status' do
    let(:status) { Fabricate(:status, account: Fabricate(:account, domain: 'example.com'), text: 'Habt ihr ein paar gute Links zu #<span class="tag"><a href="https://quitter.se/tag/wannacry" target="_blank" rel="tag noopener" title="https://quitter.se/tag/wannacry">Wannacry</a></span> herumfliegen?   Ich will mal unter <br> <a href="https://github.com/qbi/WannaCry" target="_blank" rel="noopener" title="https://github.com/qbi/WannaCry">https://github.com/qbi/WannaCry</a> was sammeln. !<a href="http://sn.jonkman.ca/group/416/id" target="_blank" rel="noopener" title="http://sn.jonkman.ca/group/416/id">security</a>&nbsp;') }

    it 'parses out URLs' 


    it 'ignores URLs to hashtags' 

  end
end
