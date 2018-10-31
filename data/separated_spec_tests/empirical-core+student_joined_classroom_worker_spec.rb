require 'rails_helper'

describe StudentJoinedClassroomWorker, type: :worker do
  let(:worker) { described_class.new }
  let(:analyzer) { double(:analyzer, track_with_attributes: true, track: true) }
  let!(:student) { create(:student) }
  let!(:teacher) { create(:teacher) }

  before do
    allow(Analyzer).to receive(:new) { analyzer }
  end

  it 'results in the sending of 2 segment.io events' 

end

