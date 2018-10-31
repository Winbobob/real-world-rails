require 'rails_helper'

describe JoinClassroomWorker, type: :worker do
  let(:worker) { AccessProgressReportWorker.new }
  let(:analytics) { SegmentAnalytics.new }
  let(:classroom) { create(:classroom) }
  let(:teacher) { classroom.owner }


  it 'sends a segment.io event ' 

end

