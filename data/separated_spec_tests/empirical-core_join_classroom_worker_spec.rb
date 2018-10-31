require 'rails_helper'

describe JoinClassroomWorker, type: :worker do
  let(:worker) { JoinClassroomWorker.new }
  let(:analytics) { SegmentAnalytics.new }
  let!(:classroom) { create(:classroom_with_one_student) }
  let(:teacher) { classroom.owner }
  let!(:student) {classroom.students.first}


  it 'sends a segment.io event ' 

end

