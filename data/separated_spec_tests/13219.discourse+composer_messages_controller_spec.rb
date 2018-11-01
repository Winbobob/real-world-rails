require 'rails_helper'

describe ComposerMessagesController do
  let(:topic) { Fabricate(:topic, created_at: 10.years.ago, last_posted_at: 10.years.ago) }
  let(:post) { Fabricate(:post, topic: topic, post_number: 1, created_at: 10.years.ago) }

  context '#index' do
    it 'requires you to be logged in' 


    context 'when logged in' do
      let!(:user) { sign_in(Fabricate(:user)) }
      let(:args) { { 'topic_id' => post.topic.id, 'post_id' => '333', 'composer_action' => 'reply' } }

      it 'redirects to your user preferences' 


      it 'delegates args to the finder' 

    end
  end
end

