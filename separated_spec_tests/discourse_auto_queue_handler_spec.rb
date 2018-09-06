require 'rails_helper'

describe Jobs::AutoQueueHandler do

  subject { Jobs::AutoQueueHandler.new.execute({}) }

  context "old flag" do
    let!(:old) { Fabricate(:flag, created_at: 61.days.ago) }
    let!(:not_old) { Fabricate(:flag, created_at: 59.days.ago) }

    it "defers the old flag if auto_handle_queued_age is 60" 


    it "doesn't defer the old flag if auto_handle_queued_age is 0" 

  end

  context "old queued post" do
    let!(:old) { Fabricate(:queued_post, created_at: 61.days.ago, queue: 'default') }
    let!(:not_old) { Fabricate(:queued_post, created_at: 59.days.ago, queue: 'default') }

    it "rejects the post when auto_handle_queued_age is 60" 


    it "doesn't reject the post when auto_handle_queued_age is 0" 

  end

end

