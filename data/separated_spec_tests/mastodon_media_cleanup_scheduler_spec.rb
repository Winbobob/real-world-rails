require 'rails_helper'

describe Scheduler::MediaCleanupScheduler do
  subject { described_class.new }

  let!(:old_media) { Fabricate(:media_attachment, account_id: nil, created_at: 10.days.ago) }
  let!(:new_media) { Fabricate(:media_attachment, account_id: nil, created_at: 1.hour.ago) }

  it 'removes old media records' 

end

