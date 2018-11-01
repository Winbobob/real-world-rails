require 'rails_helper'

describe InvalidClasscodeWorker do
  let(:subject) { described_class.new }
  let(:analyzer) { double(:analyzer, track_with_attributes: true) }
  let!(:student) { create(:student) }

  before do
    allow(Analyzer).to receive(:new) { analyzer }
  end

  describe "#perform" do
    it 'should track the invalid classcode event' 

  end
end

