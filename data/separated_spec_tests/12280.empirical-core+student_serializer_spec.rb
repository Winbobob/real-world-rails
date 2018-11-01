require 'rails_helper'

describe ProgressReports::Standards::StudentSerializer, type: :serializer do
  let(:classroom) { create(:classroom_with_one_student) }
  let(:teacher) { classroom.owner }
  let(:student) {classroom.students.first}
  let(:activity) { create(:activity) }
  let(:classroom_unit) do
    create(:classroom_unit,
      classroom: classroom,
      assigned_student_ids: [student.id]
    )
  end
  let(:student_for_report) do
    ProgressReports::Standards::Student.new(teacher).results({}).first
  end
  let(:serializer) do
    serializer = described_class.new(student_for_report)
    serializer.classroom_id = 123
    serializer
  end

  before do
    student.activity_sessions.create!(
      percentage: 0.7547,
      state: 'finished',
      completed_at: 5.minutes.ago,
      classroom_unit: classroom_unit,
      activity: activity
    )
  end

  describe '#to_json output' do
    let(:json)   { serializer.to_json }
    let(:parsed) { JSON.parse(json) }
    let(:parsed_student) { parsed['student'] }

    it 'includes the right keys' 


    it 'includes properly rounded scores' 

  end
end

