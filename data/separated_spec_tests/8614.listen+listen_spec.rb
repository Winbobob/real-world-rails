RSpec.describe Listen do
  let(:listener) { instance_double(Listen::Listener, stop: nil) }

  after do
    Listen.stop
  end

  describe '.to' do
    it 'initalizes listener' 

  end

  describe '.stop' do
    it 'stops all listeners' 

  end
end

