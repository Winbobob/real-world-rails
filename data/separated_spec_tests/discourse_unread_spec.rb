require 'rails_helper'
require 'unread'

describe Unread do

  let (:user) { Fabricate.build(:user, id: 1) }
  let (:topic) do
    Fabricate.build(:topic,
                       posts_count: 13,
                       highest_staff_post_number: 15,
                       highest_post_number: 13,
                       id: 1)
  end

  let (:topic_user) do
    Fabricate.build(:topic_user,
                        notification_level: TopicUser.notification_levels[:tracking],
                        topic_id: topic.id,
                        user_id: user.id)
  end

  def unread
    Unread.new(topic, topic_user, Guardian.new(user))
  end

  describe 'staff counts' do
    it 'shoule correctly return based on staff post number' 

  end

  describe 'unread_posts' do
    it 'should have 0 unread posts if the user has seen all posts' 


    it 'should have 6 unread posts if the user has seen all but 6 posts' 


    it 'should have 0 unread posts if the user has seen more posts than exist (deleted)' 

  end

  describe 'new_posts' do
    it 'should have 0 new posts if the user has read all posts' 


    it 'returns 0 when the topic is the same length as when you last saw it' 


    it 'has 3 new posts if the user has read 10 posts' 


    it 'has 0 new posts if the user has read 10 posts but is not tracking' 


    it 'has 0 new posts if the user read more posts than exist (deleted)' 

  end

end

