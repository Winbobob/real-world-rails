require 'rails_helper'

describe ProgressReports::Standards::TopicSerializer, type: :serializer do
  let!(:classroom) { create(:classroom_with_a_couple_students) }
  let!(:teacher) { classroom.owner }
  let!(:student) { classroom.students.first }
  let!(:topic) { create(:topic) }
  let(:activity) { create(:activity, topic: topic) }
  let(:classroom_activity) { create(:classroom_activity, classroom: classroom, activity: activity) }
  let(:topic_for_report) { ProgressReports::Standards::Topic.new(teacher).results({}).first }
  let(:serializer) do
    serializer = described_class.new(topic_for_report)
    serializer.classroom_id = 123
    serializer
  end

  before do
    student.activity_sessions.create!(
      classroom_activity: classroom_activity,
      percentage: 0.7547,
      state: 'finished',
      completed_at: 5.minutes.ago
    )
  end

  describe '#to_json output' do
    let(:json)   { serializer.to_json }
    let(:parsed) { JSON.parse(json) }
    let(:parsed_topic) { parsed['topic'] }

    it 'includes the right keys' 


    it 'includes properly rounded scores' 

  end
end

