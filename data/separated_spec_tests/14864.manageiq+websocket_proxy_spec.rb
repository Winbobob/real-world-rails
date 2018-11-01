describe WebsocketProxy do
  let(:console) { FactoryGirl.create(:system_console) }
  let(:host) { '127.0.0.1:8080' }
  let(:uri) { '/ws/console/123456789' }
  let(:logger) { double }
  let(:env) { {'HTTP_HOST' => host, 'REQUEST_URI' => uri, 'rack.hijack' => -> {}} }

  subject { described_class.new(env, console, logger) }

  describe '#initialize' do
    before do
      allow(TCPSocket).to receive(:open) # prevent real sockets from opening
    end

    it 'sets the URL' 


    describe 'based on console type' do
      before do
        [WebsocketSocket, WebsocketWebmks, WebsocketWebmksUint8utf8].each do |k|
          allow(k).to receive(:new).and_return(k.allocate)
        end
      end

      let(:proxy)      { described_class.new(env, FactoryGirl.create(:system_console, :protocol => console_type), logger) }
      let(:proto)      { proxy.instance_variable_get(:@driver).instance_variable_get(:@options)[:protocols] }
      let(:adapter)    { proxy.instance_variable_get(:@right) }
      let(:on_message) { proxy.instance_variable_get(:@driver).listeners(:message).first }
      let(:right)      { double('right socket') }

      context 'when vnc' do
        let(:console_type) { 'vnc' }

        it 'uses binary protocol' 


        it 'uses WebsocketSocket adapter' 


        it 'decodes message' 

      end

      context 'when spice' do
        let(:console_type) { 'spice' }

        it 'uses binary protocol' 


        it 'uses WebsocketSocket adapter' 


        it 'decodes message' 

      end

      context 'when webmks' do
        let(:console_type) { 'webmks' }

        it 'uses binary protocol' 


        it 'uses WebsocketWebmks adapter' 


        it 'decodes message' 

      end

      context 'when webmks-uint8utf8' do
        let(:console_type) { 'webmks-uint8utf8' }

        it 'uses uint8utf8 protocol' 


        it 'uses WebsocketWebmksUint8utf8 adapter' 


        it 'does not decode message' 

      end
    end
  end

  def assert_message_transformation(input, output)
    proxy.instance_variable_set(:@right, right)
    expect(right).to receive(:issue).with(output)
    on_message.call(double('message', :data => input))
  end

  describe '#cleanup' do
    let(:ws) { double }
    let(:sock) { subject.instance_variable_get(:@sock) }
    it 'closes the sockets and removes the db record' 

  end

  describe '#descriptors' do
    let(:ws) { 0 }
    let(:sock) { 1 }

    it 'returns the socket descriptors' 

  end

  describe '#transmit' do
    let(:driver) { double }
    let(:ws) { double }
    let(:sock) { double }

    before do
      subject.instance_variable_set(:@driver, driver)
      subject.instance_variable_set(:@ws, ws)
      subject.instance_variable_set(:@sock, sock)
      right = subject.instance_variable_get(:@right)
      right.instance_variable_set(:@sock, sock)
    end

    context 'websocket to socket' do
      let(:is_ws) { true }

      it 'reads from the websocket and parses the result' 

    end

    context 'socket to websocket' do
      let(:is_ws) { false }

      context 'binary' do
        it 'reads from the socket and sends the result to the driver' 

      end

      context 'non-binary' do
        it 'reads from the socket and sends the result to the driver' 

      end
    end
  end
end

