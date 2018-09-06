require 'rails_helper'

describe UserLoginWorker, type: :worker do
  let(:worker) { UserLoginWorker.new }
  let(:analytics) { SegmentAnalytics.new }
  let(:classroom) { create(:classroom) }
  let(:teacher) { classroom.owner }
  let(:student) { create(:student, classrooms: [classroom]) }


  it 'sends a segment.io event when a teacher logs in' 


  context 'student with teacher logs in' do
    before :each do
      worker.perform(student.id, "127.0.0.1")
    end

    it 'sends two segment.io event' 


    it 'sends segment.io event TEACHERS_STUDENT_SIGNIN when a student logs in, identifying the teacher' 


    it 'sends segment.io event STUDENT_SIGNIN when a student logs in, identifying the student (AS THE SECOND EVENT)' 

  end

  context 'student with no teacher logs in' do
    before :each do
      student.update_attributes(classcode: nil)
      worker.perform(student.id, "127.0.0.1")
    end

    it 'only sends 1 event' 

  end
end

