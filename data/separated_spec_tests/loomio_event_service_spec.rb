require "rails_helper"

describe EventService do
  let(:user) { create :user }
  let(:group) { create :formal_group }
  let(:discussion) { build :discussion, group: group }
  let(:poll) { create :poll, discussion: discussion }
  let(:comment1) { create(:comment, discussion: discussion, user: user) }
  let(:comment2) { create(:comment, discussion: discussion, user: user) }
  let(:comment3) { create(:comment, discussion: discussion, user: user) }

  before { group.add_admin! user }

  describe "readd_to_thread" do
    it "increments if spot is taken" 


    it "reintroduces if spot is available" 

  end
end

