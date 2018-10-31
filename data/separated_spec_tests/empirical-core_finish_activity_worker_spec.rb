require 'rails_helper'

describe FinishActivityWorker, type: :worker do
  let(:worker) { FinishActivityWorker.new }
  let(:analytics) { SegmentAnalytics.new }
  let(:classroom) { create(:classroom) }
  let!(:unit) {create(:unit)}
  let(:classroom_activity) { create(:classroom_activity, classroom: classroom, unit: unit) }
  let(:activity_session) { create(:activity_session,  classroom_activity: classroom_activity) }

  it 'sends a segment.io event' 

end

