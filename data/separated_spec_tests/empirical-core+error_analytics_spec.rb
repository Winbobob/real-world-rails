require 'rails_helper'

describe ErrorAnalytics do
  let(:analyzer) { double(:analyzer, track: true) }
  let(:subject) { described_class.new(analyzer) }

  before do
    allow(SecureRandom).to receive(:urlsafe_base64) { "secure_random" }
  end

  describe '#track_500' do
    it 'should track the error 500 event' 

  end
end

