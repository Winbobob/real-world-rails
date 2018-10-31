require 'rails_helper'

RSpec.describe GroupMentionsUpdater do
  let(:post) { Fabricate(:post) }

  before do
    SiteSetting.queue_jobs = false
  end

  describe '.update' do
    it 'should update valid group mentions' 


    it 'should not update invalid group mentions' 


    it "should ignore validations" 


  end
end

