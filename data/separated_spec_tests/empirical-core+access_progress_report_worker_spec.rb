require 'rails_helper'

describe AccessProgressReportWorker, type: :worker do
  let(:worker) { described_class.new }
  let!(:teacher) { create(:teacher) }
  let(:analyzer) { double(:analyzer, track: true) }

  before do
    allow(Analyzer).to receive(:new) { analyzer }
  end

  it 'sends a segment.io event ' 

end

