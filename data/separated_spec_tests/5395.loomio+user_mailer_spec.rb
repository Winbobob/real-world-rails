require "rails_helper"

describe UserMailer do
  shared_examples_for 'email_meta' do
    it 'renders the receiver email' 


    it 'renders the sender email' 

  end

  context 'sending email on membership approval' do
    before :each do
      @user = create(:user)
      @group = create(:formal_group)
      @membership = create(:membership, user: @user, group: @group)
      @event = Events::MembershipRequestApproved.create(kind: 'membership_request_approved', user: @user, eventable: @membership)
      @mail = UserMailer.membership_request_approved(@user, @event)
    end

    it_behaves_like 'email_meta'

    it 'assigns correct reply_to' 


    it 'renders the subject' 


    it 'assigns confirmation_url for email body' 


  end

  context 'sending email on being added to group' do
    before :each do
      @user = create(:user)
      @inviter = create(:user)
      @group = create(:formal_group, full_name: "Group full name")
      @membership = create(:membership, user: @user, group: @group, inviter: @inviter)
      @event = Events::UserAddedToGroup.create(kind: 'user_added_to_group', user: @inviter, eventable: @membership)
      @mail = UserMailer.user_added_to_group(@user, @event)
    end

    it 'renders the subject' 


    it 'uses group.full_name in the email body' 

  end

  describe 'contact request' do
    let(:user) { create :user }
    let(:sender) { create :user }
    let(:group) { create :group }
    let(:request) { ContactRequest.new(sender: sender, recipient_id: user.id, message: "Here's a message") }
    subject { UserMailer.contact_request(contact_request: request).deliver_now }

    it 'sends a contact request' 

  end

  describe 'catch_up' do
    let(:user) { create :user, email_catch_up: true }
    subject { UserMailer.catch_up(user).deliver_now }
    let(:discussion) { build :discussion, group: group }
    let(:poll) { build :poll, discussion: discussion }
    let(:comment) { build :comment, discussion: discussion }
    let(:group) { create :formal_group }
    before { group.add_member! user }

    let(:some_content) do
      DiscussionService.create(discussion: discussion, actor: discussion.author)
      PollService.create(poll: poll, actor: discussion.author)
      CommentService.create(comment: comment, actor: comment.author)
    end

    it 'sends a missed yesterday email' 


    it 'does not send a missed yesterday email when there is no unread content' 


    it 'does not send a missed yesterday email if I have unsubscribed' 

  end

end

