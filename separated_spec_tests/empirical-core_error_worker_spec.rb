require 'rails_helper'

describe ErrorWorker, type: :worker do

  let!(:analytics) { SegmentAnalytics.new }

  it 'sends a segment.io event' 

end

