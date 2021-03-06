require 'rails_helper'

describe ProgressReports::Concepts::ConceptSerializer, type: :serializer do
  let!(:classroom) { create(:classroom) }
  let(:teacher) { classroom.owner }
  let!(:student) { create(:user, role: 'student', classrooms: [classroom])}
  let(:activity) { create(:activity) }
  let(:unit_activity) { create(:unit_activity, activity: activity) }
  let(:classroom_unit) do
    create(:classroom_unit,
      classroom: classroom,
      assigned_student_ids: [student.id]
    )
  end
  let(:concept_for_report) do
    ProgressReports::Concepts::Concept.results(teacher, {}).first
  end
  let(:concept) { create(:concept) }
  let(:serializer) { described_class.new(concept_for_report) }

  before do
    activity_session = student.activity_sessions.create!(
      activity: activity,
      percentage: 0.7547,
      state: 'finished',
      completed_at: 5.minutes.ago,
      classroom_unit: classroom_unit
    )
    activity_session.concept_results
      .create!(concept: concept, metadata: {'correct' => 1})
    activity_session.concept_results
      .create!(concept: concept, metadata: {'correct' => 0})
  end

  describe '#to_json' do
    subject { JSON.parse(serializer.to_json) }
    let(:parsed_concept) { subject['concept'] }

    it 'includes the right keys' 


    it 'includes the percentage' 

  end
end

