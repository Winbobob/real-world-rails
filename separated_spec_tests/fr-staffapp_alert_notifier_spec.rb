require 'rails_helper'

RSpec.describe AlertNotifier do

  describe '#run!' do
    describe 'check dwp status' do
      before do
        dwp_monitor = instance_double('DwpMonitor', state: state)
        allow(DwpMonitor).to receive(:new).and_return dwp_monitor
      end

      context 'online' do
        let(:state) { 'online' }

        it "do not send and email if all is good" 

      end

      context 'offline' do
        let(:state) { 'offline' }

        it "send and email if dwp is offline" 

      end
    end
  end
end

