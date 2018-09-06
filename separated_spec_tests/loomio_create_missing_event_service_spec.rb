require "rails_helper"

describe CreateMissingEventService do
  let(:user) { create :user }
  let(:group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:poll) { create :poll, discussion: discussion }
  let(:comment) { create(:comment, discussion: discussion, user: user) }
  let(:reply_comment) { create(:comment, discussion: discussion, user: user, parent: comment) }
  let(:stance) { create(:stance, poll: poll, participant: user) }
  let(:outcome) { create(:outcome, poll: poll, author: user) }

  before { group.add_admin! user }

  it "creates missing new_discussion events" 


  it "fixes new_comment event depth and parent values" 


  it "creates missing poll, stance, outcome created events" 

end

