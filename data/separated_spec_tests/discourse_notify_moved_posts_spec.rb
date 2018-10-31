require 'rails_helper'
require_dependency 'jobs/base'
require_dependency 'jobs/regular/process_post'

describe Jobs::NotifyMovedPosts do

  it "raises an error without post_ids" 


  it "raises an error without moved_by_id" 


  context 'with post ids' do
    let!(:p1) { Fabricate(:post) }
    let!(:p2) { Fabricate(:post, user: Fabricate(:evil_trout), topic: p1.topic) }
    let!(:p3) { Fabricate(:post, user: p1.user, topic: p1.topic) }
    let(:admin) { Fabricate(:admin) }

    let(:moved_post_notifications) { Notification.where(notification_type: Notification.types[:moved_post]) }

    it "should create two notifications" 


    context 'when moved by one of the posters' do
      it "create one notifications, because the poster is the mover" 

    end

  end

end

