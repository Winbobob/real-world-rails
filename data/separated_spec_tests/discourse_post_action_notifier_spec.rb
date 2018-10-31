require 'rails_helper'
require_dependency 'post_destroyer'

describe PostActionNotifier do

  before do
    PostActionNotifier.enable
  end

  let!(:evil_trout) { Fabricate(:evil_trout) }
  let(:post) { Fabricate(:post) }

  context 'liking' do
    context 'when liking a post' do
      it 'creates a notification' 

    end

    context 'when removing a liked post' do
      it 'removes a notification' 

    end
  end

  context 'when editing a post' do
    it 'notifies a user of the revision' 


    context "edit notifications are disabled" do

      before { SiteSetting.disable_edit_notifications = true }

      it 'notifies a user of the revision made by another user' 


      it 'does not notifiy a user of the revision made by the system user' 


    end

  end

  context 'private message' do
    let(:user) { Fabricate(:user) }
    let(:mention_post) { Fabricate(:post, user: user, raw: 'Hello @eviltrout') }
    let(:topic) do
      topic = mention_post.topic
      topic.update_columns archetype: Archetype.private_message, category_id: nil
      topic
    end

    it "won't notify someone who can't see the post" 


    it 'creates like notifications' 

  end

  context 'moderator action post' do
    let(:user) { Fabricate(:user) }
    let(:first_post) { Fabricate(:post, user: user, raw: 'A useless post for you.') }
    let(:topic) { first_post.topic }

    it 'should not notify anyone' 

  end

end

