require 'rails_helper'
describe API::DiscussionsController do

  let(:subgroup) { create :formal_group, parent: group }
  let(:another_group) { create :formal_group }
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:poll) { create :poll, discussion: discussion }
  let(:reader) { DiscussionReader.for(user: user, discussion: discussion) }
  let(:another_discussion) { create :discussion }
  let(:comment) { create :comment, discussion: discussion}
  let(:new_comment) { build(:comment, discussion: discussion) }
  let(:discussion_params) {{
    title: 'Did Charlie Bite You?',
    description: 'From the dawn of internet time...',
    group_id: group.id,
    private: true
  }}

  before do
    group.add_admin! user
  end

  context 'as an oauthed user' do
    let(:user) { create(:user) }
    let(:access_token) { create :access_token, resource_owner_id: user.id }

    it 'can fetch records' 


    it 'returns forbidden if the access token is not found' 


    it 'returns unauthorized if the access token has been revoked' 


    it 'returns unauthorized if the access token is expired' 

  end

  describe 'inbox' do
    context 'logged out' do
      it 'responds with forbidden for logged out users' 

    end

    context 'logged in' do
      before do
        sign_in user
        reader.viewed!
        group.add_member! another_user
      end

      it 'returns unread threads' 


      it 'does not return read threads' 


      it 'does not return dismissed threads' 


      it 'does not return threads in muted discussions' 


      it 'does not return threads in muted groups' 


      it 'includes active polls' 

    end
  end

  describe 'dashboard' do
    context 'logged out' do
      it 'responds with forbidden for logged out users' 

    end

    describe 'guest threads' do
      it 'displays guest threads' 

    end

    describe 'filtering' do
      let(:subgroup_discussion) { create :discussion, group: subgroup }
      let(:muted_discussion) { create :discussion, group: group }
      let(:old_discussion) { create :discussion, group: group, created_at: 4.months.ago, last_activity_at: 4.months.ago }
      let(:motionless_discussion) { create :discussion, group: group }

      before do
        sign_in user
        another_group.add_member! user
        subgroup.add_member! user
        discussion.reload
        DiscussionReader.for(user: user, discussion: muted_discussion).set_volume! 'mute'
      end

      it 'does not return muted discussions by default' 


      it 'can filter by muted' 


      it 'can filter since a certain date' 


      it 'can filter until a certain date' 


      it 'can limit collection size' 

    end
  end

  describe 'show' do
    context 'logged in' do
      before { sign_in user }
      it 'returns the discussion json' 


      it 'displays discussion to guest group members' 


      it 'returns the reader fields' 

    end

    context 'logged out' do
      let(:public_discussion) { create :discussion, private: false }
      let(:private_discussion) { create :discussion, private: true }

      it 'returns a public discussions' 


      it 'returns unauthorized for a private discussion' 

    end
  end

  describe 'dismiss' do
    before { sign_in user }

    let(:reader) { DiscussionReader.for(user: user, discussion: discussion) }

    before do
      group.add_admin! user
      sign_in user
      reader.update(volume: DiscussionReader.volumes[:normal])
      reader.reload
    end

    it "updates dismissed_at" 

  end

  describe 'recall' do
    before { sign_in user }

    let(:reader) { DiscussionReader.for(user: user, discussion: discussion) }

    before do
      group.add_admin! user
      sign_in user
      reader.update(volume: DiscussionReader.volumes[:normal], dismissed_at: 1.day.ago)
      reader.reload
    end

    it "updates dismissed_at to be nil" 

  end

  describe 'move' do
    before { sign_in user }

    context 'success' do
      it 'moves a discussion' 

    end
  end

  describe 'index' do
    let(:another_discussion)    { create :discussion, group: another_group }

    before do
      discussion; another_discussion
    end

    context 'logged out' do
      let!(:public_discussion) { create :discussion, private: false }
      let!(:private_discussion) { create :discussion, private: true }

      it 'returns a list of public discussions' 

    end

    context 'logged in' do
      before { sign_in user }

      context 'success' do
        it 'returns discussions filtered by group' 


        it 'does not display discussions not visible to the current user' 


        it 'can display content from a specified public group' 


        it 'responds to a since parameter' 


        it 'responds to an until parameter' 


        it 'responds with active polls' 

      end
    end
  end

  describe 'set_volume' do
    before { sign_in user }

    context 'success' do
      it 'sets the volume of a thread' 

    end

    context 'failure' do
      it 'does not update a reader' 

    end
  end

  describe 'update' do
    before { sign_in user }
    let(:document) { create(:document) }

    context 'success' do
      it "updates a discussion" 


      it 'adds documents' 


      it 'removes documents' 

    end

    context 'failures' do
      it "responds with an error when there are unpermitted params" 


      it "responds with an error when the user is unauthorized" 


      it "responds with validation errors when they exist" 

    end
  end

  describe 'create' do
    before { sign_in user }

    context 'success' do
      it "creates a discussion" 


      it 'doesnt email everyone' 


      it 'emails mentioned users' 


      it 'responds with json' 

    end

    context 'failures' do
      it "responds with an error when there are unpermitted params" 


      it "responds with an error when the user is unauthorized" 


      it "responds with validation errors when they exist" 

    end
  end

  describe 'mark_as_seen' do
    it 'marks a discussion as seen' 


    it 'does not allow non-users to mark discussions as seen' 

  end

  describe 'mark_as_read' do
    let!(:event) { create :event, sequence_id: 2, discussion: discussion, user: another_user }
    let!(:another_event) { create :event, sequence_id: 3 }

    context 'signed out' do
      it 'does not attempt to mark discussions as read while logged out' 

    end

    context 'signed in' do
      before do
        sign_in user
        group.add_admin! user
        reader.update(volume: DiscussionReader.volumes[:normal])
        reader.reload
      end

      it "Marks thread item as read" 

      #
      # it 'does not mark an inaccessible discussion as read' do
      #   patch :mark_as_read, id: another_event.sequence_id
      #   expect(response.status).to eq 403
      #   expect(reader.reload.read_items_count).to eq 0
      # end

      it 'responds with reader fields' 

    end
  end

  describe 'close' do
    it 'allows admins to close a thread' 


    it 'does not allow non-admins to close a thread' 


    it 'does not allow logged out users to close a thread' 

  end

  describe 'reopen' do
    before { discussion.update(closed_at: 1.day.ago) }

    it 'allows admins to reopen a thread' 


    it 'does not allow non-admins to reopen a thread' 


    it 'does not allow logged out users to reopen a thread' 

  end

  describe 'pin' do
    it 'allows admins to pin a thread' 


    it 'allows admins to unpin a thread' 


    it 'does not allow non-admins to pin a thread' 


    it 'does not allow logged out users to pin a thread' 

  end

  describe 'fork' do
    let(:user) { create :user }
    let(:another_user) { create :user }
    let(:group) { create :formal_group }
    let!(:discussion) { create :discussion, group: group }
    let(:target_event) { create :event, discussion: discussion, kind: :new_comment, eventable: create(:comment, discussion: discussion), sequence_id: 2 }
    let(:another_event) { create :event, discussion: discussion, kind: :new_comment, eventable: create(:comment, discussion: discussion), sequence_id: 3 }
    let(:fork_params) {{
      title: "A forked title",
      group_id: group.id,
      description: "A forked description",
      private: true,
      forked_event_ids: [target_event.id, another_event.id]
    }}

    before { group.add_admin! user }

    it 'forks a thread' 


    it 'transfers read state from old discussion readers' 


    it 'does not allow non admins to fork a thread' 

  end
end

