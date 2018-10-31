require 'rails_helper'

describe GroupExportService do
  let!(:group)            { create :formal_group }
  let!(:subgroup)         { create :formal_group, parent: group }
  let!(:another_group)    { create :formal_group }
  let!(:user)             { create :user }
  let!(:another_user)     { create :user }
  let!(:discussion)       { create :discussion, group: group }
  let!(:sub_discussion)   { create :discussion, group: subgroup }
  let!(:poll)             { create :poll, group: group }
  let!(:sub_poll)         { create :poll, group: subgroup }
  let!(:discussion_poll)  { create :poll, discussion: discussion }
  let!(:comment)          { create :comment, discussion: discussion }
  let!(:sub_comment)      { create :comment, discussion: sub_discussion }
  let!(:group_doc)        { create :document, model: group }
  let!(:discussion_doc)   { create :document, model: discussion }
  let!(:poll_doc)         { create :document, model: poll }
  let!(:comment_doc)      { create :document, model: comment }
  let!(:reader)           { create :discussion_reader, discussion: discussion, user: another_user }
  let!(:event)            { discussion.created_event }
  let!(:notification)     { event.notifications.create!(user: another_user, url: 'test.com') }
  let!(:discussion_reaction) { create :reaction, reactable: discussion }
  let!(:poll_reaction)       { create :reaction, reactable: poll }
  let!(:comment_reaction)    { create :reaction, reactable: comment }

  before do
    group.add_admin! user
    group.add_member! another_user
    @email_api_key = user.email_api_key
  end

  describe 'export and import' do
    it 'can export a group' 

  end
end

