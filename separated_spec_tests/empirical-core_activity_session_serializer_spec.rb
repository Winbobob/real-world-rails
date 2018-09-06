require 'rails_helper'

describe ProgressReports::ActivitySessionSerializer, type: :serializer do
  let(:activity_session)   { create(:activity_session,
    started_at: started_at,
    completed_at: completed_at,
    percentage: 0.25,
    classroom_activity: classroom_activity)
  }
  let(:classroom) { create(:classroom) }
  let(:topic) { create(:topic) }
  let(:activity) { create(:activity, topic: topic) }
  let(:classroom_activity) { create(:classroom_activity, classroom: classroom, activity: activity) }
  let(:started_at) { Time.zone.local(2015, 1, 1, 12, 15, 0) }
  let(:completed_at) { Time.zone.local(2015, 1, 1, 13, 0, 0) }
  let(:serializer) { ProgressReports::ActivitySessionSerializer.new(activity_session) }

  describe '#to_json output' do
    let(:json)   { serializer.to_json }
    let(:parsed) { JSON.parse(json) }
    let(:parsed_session) { parsed['activity_session'] }

    it 'includes the right keys' 


    it 'includes fields pre-formatted for display' 


    context 'when the activity session is missing relevant info' do
      let(:activity_session)   { create(:activity_session,
          completed_at: nil,
          percentage: nil,
          classroom_activity: classroom_activity,
          state: 'unstarted'
        )
      }
      let(:topic) { nil }

      it 'still works' 

    end
  end
end

