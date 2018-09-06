require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec_helper'))

RSpec.describe HTTParty::Logger::ApacheFormatter do
  let(:subject) { described_class.new(logger_double, :info) }
  let(:logger_double) { double('Logger') }
  let(:request_double) { double('Request', http_method: Net::HTTP::Get, path: "http://my.domain.com/my_path") }
  let(:request_time) { Time.new.strftime("%Y-%m-%d %H:%M:%S %z") }

  before do
    subject.current_time = request_time
    expect(logger_double).to receive(:info).with(log_message)
  end

  describe "#format" do
    let(:log_message) { "[HTTParty] [#{request_time}] 302 \"GET http://my.domain.com/my_path\" - " }

    it "formats a response in a style that resembles apache's access log" 


    context 'when there is a parsed response' do
      let(:log_message) { "[HTTParty] [#{request_time}] 200 \"GET http://my.domain.com/my_path\" 512 "}

      it "can handle the Content-Length header" 

    end
  end
end

