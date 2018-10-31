require "rails_helper"

describe PostOwnerChanger do
  describe "change_owner!" do
    let!(:editor) { Fabricate(:admin) }
    let(:topic) { Fabricate(:topic) }
    let(:user_a) { Fabricate(:user) }
    let(:p1) { Fabricate(:post, topic_id: topic.id) }
    let(:p2) { Fabricate(:post, topic_id: topic.id) }
    let(:p3) { Fabricate(:post) }

    it "raises an error with a parameter missing" 


    it "calls PostRevisor" 


    it "changes the user" 


    it "changes multiple posts" 


    it "ignores posts in other topics" 


    it "skips creating new post revision if skip_revision is true" 


    it "changes the user even when the post does not pass validation" 


    it "changes the user even when the topic does not pass validation" 


    context "sets topic notification level for the new owner" do
      let(:p4) { Fabricate(:post, post_number: 2, topic_id: topic.id) }

      it "'watching' if the first post gets a new owner" 


      it "'tracking' if other than the first post gets a new owner" 

    end

    context "integration tests" do
      let(:p1user) { p1.user }
      let(:p2user) { p2.user }

      before do
        topic.update!(user_id: p1user.id)

        p1user.user_stat.update!(
          topic_count: 1,
          post_count: 1,
          first_post_created_at: p1.created_at,
          topic_reply_count: 0
        )

        p2user.user_stat.update!(
          topic_count: 0,
          post_count: 1,
          first_post_created_at: p2.created_at,
          topic_reply_count: 1
        )

        UserAction.create!(action_type: UserAction::NEW_TOPIC, user_id: p1user.id, acting_user_id: p1user.id,
                           target_post_id: -1, target_topic_id: p1.topic_id, created_at: p1.created_at)
        UserAction.create!(action_type: UserAction::REPLY, user_id: p2user.id, acting_user_id: p2user.id,
                           target_post_id: p2.id, target_topic_id: p2.topic_id, created_at: p2.created_at)

        UserActionCreator.enable
      end

      subject(:change_owners) do
        described_class.new(
          post_ids: [p1.id, p2.id],
          topic_id: topic.id,
          new_owner: user_a,
          acting_user: editor
        ).change_owner!
      end

      it "updates users' topic and post counts" 


      it "handles whispers" 


      context 'private message topic' do
        let(:topic) { Fabricate(:private_message_topic) }

        it "should update users' counts" 

      end

      it "updates UserAction records" 

    end
  end
end

