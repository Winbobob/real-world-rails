require 'rails_helper'

describe AssignActivityWorker, type: :worker do
  let(:worker) { AssignActivityWorker.new }
  let(:analytics) { SegmentAnalytics.new }
  let(:teacher) { create(:teacher) }

  it 'sends a segment.io event' 

end

