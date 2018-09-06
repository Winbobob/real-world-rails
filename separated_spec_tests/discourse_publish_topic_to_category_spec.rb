require 'rails_helper'

RSpec.describe Jobs::PublishTopicToCategory do
  let(:category) { Fabricate(:category) }
  let(:another_category) { Fabricate(:category) }

  let(:topic) do
    topic = Fabricate(:topic, category: category)

    Fabricate(:topic_timer,
      status_type: TopicTimer.types[:publish_to_category],
      category_id: another_category.id,
      topic: topic
    )

    topic
  end

  before do
    SiteSetting.queue_jobs = true
  end

  describe 'when topic has been deleted' do
    it 'should not publish the topic to the new category' 

  end

  it 'should publish the topic to the new category' 


  describe 'when topic is a private message' do
    before do
      freeze_time 1.hour.ago do
        expect { topic.convert_to_private_message(Discourse.system_user) }
          .to change { topic.private_message? }.to(true)
      end
    end

    it 'should publish the topic to the new category' 

  end
end

