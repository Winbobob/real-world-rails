require 'topic_publisher'
require 'rails_helper'

describe TopicPublisher do

  context "shared drafts" do
    let(:shared_drafts_category) { Fabricate(:category) }
    let(:category) { Fabricate(:category) }

    before do
      SiteSetting.shared_drafts_category = shared_drafts_category.id
    end

    context "publishing" do
      let(:topic) { Fabricate(:topic, category: shared_drafts_category, visible: false) }
      let(:shared_draft) { Fabricate(:shared_draft, topic: topic, category: category) }
      let(:moderator) { Fabricate(:moderator) }
      let(:op) { Fabricate(:post, topic: topic) }

      before do
        # Create a revision
        op.set_owner(Fabricate(:coding_horror), Discourse.system_user)
        op.reload
      end

      it "will publish the topic properly" 

    end

  end

end

