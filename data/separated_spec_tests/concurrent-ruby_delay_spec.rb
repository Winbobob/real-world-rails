require_relative 'concern/dereferenceable_shared'
require_relative 'concern/obligation_shared'

module Concurrent

  RSpec.describe Delay do

    context 'behavior' do

      # dereferenceable

      def dereferenceable_subject(value, opts = {})
        delay = Delay.new(opts){ value }
        delay.tap{ delay.value }
      end

      it_should_behave_like :dereferenceable

      # obligation

      let!(:fulfilled_value) { 10 }
      let!(:rejected_reason) { StandardError.new('mojo jojo') }

      let(:pending_subject) do
        Delay.new(executor: :fast){ sleep 0.05; fulfilled_value }
      end

      let(:fulfilled_subject) do
        delay = Delay.new{ fulfilled_value }
        delay.tap{ delay.value }
      end

      let(:rejected_subject) do
        delay = Delay.new{ raise rejected_reason }
        delay.tap{ delay.value }
      end

      it_should_behave_like :obligation
    end

    context '#initialize' do

      it 'sets the state to :pending' 


      it 'raises an exception when no block given' 

    end


    context '#reconfigure' do
      it 'returns value of block used in reconfiguration' 


      it 'returns false when process completed?' 

    end

    context '#value' do

      let(:task){ proc{ nil } }

      it 'does not call the block before #value is called' 


      it 'calls the block when #value is called' 


      it 'only calls the block once no matter how often #value is called' 

    end
  end
end

