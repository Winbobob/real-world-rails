require 'rails_helper'
describe API::EventsController do

  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:group) { create :formal_group }
  let(:discussion) { create :discussion, group: group, private: false }
  let(:another_discussion) { create :discussion, group: group, private: true }
  let(:reader) { DiscussionReader.for(user: user, discussion: discussion) }

  before do
    group.add_admin! user
    group.add_member! another_user
  end

  describe 'index' do

    before { sign_in user }

    context 'success' do

      before do
        @event         = CommentService.create(comment: build(:comment, discussion: discussion), actor: user)
        @another_event = CommentService.create(comment: build(:comment, discussion: another_discussion), actor: user)
      end

      context 'logged out' do
        before { @controller.stub(:current_user).and_return(LoggedOutUser.new) }

        it 'returns a list of events for public discussions' 


        it 'responds with forbidden for private discussions' 

      end

      # context "remove from thread" do
      #   it 'removes discussion_id if permitted' do
      #     @edited_event = Events::DiscussionEdited.publish!(discussion, user)
      #     expect(@edited_event.discussion_id).to be discussion.id
      #     patch :remove_from_thread, params: { id: @edited_event.id }
      #     json = JSON.parse(response.body)
      #     expect(json.keys).to include *(%w[events])
      #     result_event = json['events'].last
      #     expect(result_event['discussion_id']).to be nil
      #     expect(result_event['id']).to be @edited_event.id
      #   end
      #
      #   it 'denys if not permitted' do
      #     patch :remove_from_thread, params: { id: @event.id }
      #     expect(response.status).to eq 403
      #   end
      # end

      it 'returns events filtered by discussion' 


      # later on, not now
      # it 'excludes specific sequence ids given ranges' do
      #   ranges_str = RangeSet.serialize RangeSet.to_ranges(@event.sequence_id)
      #   get :index, discussion_id: discussion.id, exclude_sequence_ids: ranges_str
      #   json = JSON.parse(response.body)
      #   event_ids = json['events'].map { |v| v['id'] }
      #   expect(event_ids).to_not include @event.id
      # end

      it 'responds with a discussion with a reader' 


    end

    context 'with comment' do
      before do
        @event = CommentService.create(comment: build(:comment, discussion: discussion), actor: user)
      end

      it 'returns events beginning with a given comment id' 


      it 'returns 404 when comment not found' 

    end

    context 'with parent_id' do
      before do
        @discussion_event = DiscussionService.create(discussion: discussion, actor: user)
        @parent_comment =  build(:comment, discussion: discussion)
        @parent_event = CommentService.create(comment: @parent_comment, actor: user)
        @child_event = CommentService.create(comment: build(:comment, discussion: discussion, parent: @parent_comment), actor: user)
        @unrelated_event = CommentService.create(comment: build(:comment, discussion: discussion), actor: user)
      end

      it 'returns events with given parent_id' 

    end

    context 'paging' do

      before do
        5.times { CommentService.create(comment: build(:comment, discussion: discussion), actor: user) }
      end

      it 'responds to a limit parameter' 


      it 'responds to a from parameter' 


      context 'with deleted events' do
        it 'accounts for deleted sequence ids' 

      end
    end
  end
end

