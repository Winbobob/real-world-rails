require 'rails_helper'

describe StudentJoinedClassroomWorker, type: :worker do
  let(:worker) { StudentJoinedClassroomWorker.new }
  let(:analytics) { SegmentAnalytics.new }
  let(:student) { create(:student) }
  let(:teacher) { create(:teacher) }

  it 'results in the sending of 2 segment.io events' 

end

