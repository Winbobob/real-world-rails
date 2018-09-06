require 'spec_helper'

describe 'SynchronousHttpRequester' do
  describe '#retrieve_content' do
    let(:get_request) { double('HTTP::Get') }
    let(:http_session) { double('Net::HTTP', request: response) }
    let(:url) { 'http://host/path.html?parameter=value' }
    let(:response) { double('HTTPResponse', code: '200', body: 'response body', header: {}) }
    let(:net_http_builder) { double(:net_http_builder, build: http_session) }

    before do
      allow(Net::HTTP::Get).to receive(:new).with('/path.html?parameter=value').and_return(get_request)
    end

    subject { SynchronousHttpRequester.new(net_http_builder) }

    context 'when the response status code is in the 200s' do
      it 'returns the response body' 

    end

    context 'when the response status code is in the 300s' do
      let(:new_location) { 'http://redirect/to/here' }
      let(:response) { double('HTTPResponse', body: nil, header: {'location' => new_location}, code: (rand 300..399).to_s) }
      let(:redirected_get_request) { double(:redirected_get_request) }

      it 'should follow the redirect' 

    end

    context 'when the response status code is in the 400s to 500s' do
      let(:response) { double('HTTPResponse', body: 'response body', code: (rand 400..599).to_s) }

      it 'returns a helpful error' 

    end
  end

  def session_that_responds_with(response_body)
    response = double(:response, code: '200', body: response_body, header: {})
    double(:net_http_session, request: response)
  end

end

