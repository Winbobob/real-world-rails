require 'listen/listener/config'
RSpec.describe Listen::Listener::Config do
  describe 'options' do
    context 'custom options' do
      subject do
        described_class.new(
          latency: 1.234,
          wait_for_delay: 0.85,
          force_polling: true,
          relative: true)
      end

      it 'extracts adapter options' 


      it 'extract adapter selecting options' 

    end
  end
end

