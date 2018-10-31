RSpec.describe Listen::Adapter do
  let(:listener) { instance_double(Listen::Listener, options: {}) }
  before do
    allow(Listen::Adapter::BSD).to receive(:usable?) { false }
    allow(Listen::Adapter::Darwin).to receive(:usable?) { false }
    allow(Listen::Adapter::Linux).to receive(:usable?) { false }
    allow(Listen::Adapter::Windows).to receive(:usable?) { false }
  end

  describe '.select' do
    it 'returns Polling adapter if forced' 


    it 'returns BSD adapter when usable' 


    it 'returns Darwin adapter when usable' 


    it 'returns Linux adapter when usable' 


    it 'returns Windows adapter when usable' 


    context 'no usable adapters' do
      before { allow(Kernel).to receive(:warn) }

      it 'returns Polling adapter' 


      it 'warns polling fallback with default message' 


      it "doesn't warn if polling_fallback_message is false" 


      it 'warns polling fallback with custom message if set' 

    end
  end
end

