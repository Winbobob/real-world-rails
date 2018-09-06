require "rails_helper"

RSpec.describe TopicsController, 'basics', type: :controller do
  fixtures :forums, :topics, :posts, :users


  def create_topic
    post :create, params: { forum_id: 'testforum', topic: { title: 'howdy', body: '.' } }
  end

  it "should not allow a post from a guest user" 


  it "should allow a post from a logged in user" 

end

