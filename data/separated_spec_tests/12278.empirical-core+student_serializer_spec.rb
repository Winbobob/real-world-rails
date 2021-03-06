require 'rails_helper'

describe ProgressReports::Concepts::StudentSerializer, type: :serializer do
  let!(:classroom) { create(:classroom) }
  let(:teacher) { classroom.owner }
  let!(:student) { create(:user, role: 'student', classrooms: [classroom])}
  let(:activity) { create(:activity) }
  let(:unit) { create(:unit) }
  let(:classroom_unit) do
    create(:classroom_unit,
      unit: unit,
      classroom: classroom,
      assigned_student_ids: [student.id]
    )
  end
  let(:student_for_report) { ProgressReports::Concepts::User.results(teacher, {}).first }
  let(:concept) { create(:concept) }
  let(:serializer) { described_class.new(student_for_report) }

  before do
    activity_session = student.activity_sessions.create!(
      classroom_unit: classroom_unit,
      percentage: 0.7547,
      state: 'finished',
      completed_at: 5.minutes.ago,
    )
    activity_session.concept_results.create!(concept: concept, metadata: {'correct' => 1})
    activity_session.concept_results.create!(concept: concept, metadata: {'correct' => 0})
  end

  describe '#to_json' do
    subject { JSON.parse(serializer.to_json) }
    let(:parsed_student) { subject['student'] }

    it 'includes the right keys' 


    it 'includes the percentage' 

  end
end

