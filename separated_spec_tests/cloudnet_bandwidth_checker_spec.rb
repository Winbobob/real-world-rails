require 'rails_helper'

describe BandwidthChecker do
  let(:server) { FactoryGirl.create(:server) }
  subject { BandwidthChecker.new(server) }

  context 'bandwidth not exceeded' do
    before :each do
      allow(subject).to receive(:paid_bandwidth).and_return 0
      allow(subject).to receive(:reported_bandwidth).and_return 0
    end

    it 'user bandwidth threshold equals 5GB' 


    it 'admin bandwidth threshold equals as declared' 


    it 'has no bandwidth exceeded' 

  end

  context 'bandwidth exceeded' do
    before :each do
      allow(subject).to receive(:paid_bandwidth).and_return(6 * 1024)
      allow(subject).to receive(:reported_bandwidth).and_return 0
    end

    it 'has user bandwidth exceeded' 


    it 'has no admin bandwidth exceeded' 


    it 'has admin bandwidth exceeded' 

  end

  context 'informing emails' do
    def initial_conditions
      allow(subject).to receive(:paid_bandwidth).and_return(100)
      @sent_user_double = double('sent_user_double')
      expect(@sent_user_double).to receive(:notify_bandwidth_exceeded)
      expect(server.exceed_bw_value).to eq 0
      expect(server.exceed_bw_user_notif).to eq 0
      expect(server.exceed_bw_user_last_sent).to be_nil
      expect(server.exceed_bw_admin_notif).to eq 0
    end

    it 'informs user and updates fields' 


    it 'informs admin and updates fields' 

  end
end

