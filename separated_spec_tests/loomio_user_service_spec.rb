require 'rails_helper'
describe UserService do
  describe 'verify' do
    it 'sets email_verfied true if email is unique' 


    it 'returns user if already verified' 

  end

  describe 'delete_spam' do
    let(:spam_user) { FactoryBot.create :user }
    let(:spam_group) { FactoryBot.build :formal_group }
    let(:innocent_group) { FactoryBot.create :formal_group }
    let(:discussion_in_spam_group) { FactoryBot.build :discussion, group: spam_group }
    let(:spam_discussion_in_innocent_group) { FactoryBot.build :discussion, group: innocent_group }
    let(:discussion_in_innocent_group) { FactoryBot.create :discussion, group: innocent_group }
    let(:spam_comment) { FactoryBot.build :comment, discussion: discussion_in_innocent_group }

    before do
      #the create the spam group
      GroupService.create(group: spam_group, actor: spam_user)

      #they create a spam discussion in the spam group
      DiscussionService.create(discussion: discussion_in_spam_group, actor: spam_user)

      # they join an innocent group such as loomio commune
      innocent_group.add_member! spam_user

      # spam the loomio commune group with a discussion
      DiscussionService.create(discussion: spam_discussion_in_innocent_group, actor: spam_user.reload)

      # spam the loomio communie discussion with comments
      CommentService.create(comment: spam_comment, actor: spam_user)

      UserService.delete_spam(spam_user)
    end

    it 'destroys the groups created by the user' 


    it 'destroys the user' 


    it 'destroys the discussions in the spammy groups' 


    it 'destroys spammy discussions in innocent groups' 


    it 'destroys spammy comments in innocent groups' 

  end
end

