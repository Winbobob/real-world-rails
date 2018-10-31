require 'rails_helper'

describe "JoinClassroomAnalytics" do

  let(:analytics) { JoinClassroomAnalytics.new }
  let(:segment_analytics) { SegmentAnalytics.new }
  let(:track_calls) { segment_analytics.backend.track_calls }
  let(:identify_calls) { segment_analytics.backend.identify_calls }

  let(:classroom) { create(:classroom) }
  let(:teacher) { classroom.owner }
  let(:student) { create(:student, classrooms: [classroom]) }


  it 'identifies teacher' 


  it 'sends event for teacher' 


end

