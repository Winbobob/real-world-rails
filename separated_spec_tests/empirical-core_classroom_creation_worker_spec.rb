require 'rails_helper'

describe ClassroomCreationWorker, type: :worker do
  let(:worker) { ClassroomCreationWorker.new }
  let(:analytics) { SegmentAnalytics.new }
  let(:classroom) { create(:classroom) }

  it 'sends a segment.io event' 

end

