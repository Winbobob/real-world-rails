require 'rails_helper'

RSpec.describe TopicViewPostsSerializer do
  let(:user) { Fabricate(:user) }
  let(:post) { Fabricate(:post) }
  let(:topic) { post.topic }
  let(:topic_view) { TopicView.new(topic, user, post_ids: [post.id]) }

  subject do
    described_class.new(topic_view,
      scope: Guardian.new(Fabricate(:admin)),
      root: false
    )
  end

  it 'should return the right attributes' 

end

