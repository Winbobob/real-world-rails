# frozen_string_literal: true

RSpec::Matchers.define :have_subscribers do
  match do |posts|
    posts.map(&:subscribers).delete_if(&:empty?).any?
  end
end

# verifications of data generation (protect us from possible false positives in case of poor data preset)
describe DataGenerator do
  let(:user) { FactoryGirl.create(:user) }
  let(:generator) { DataGenerator.new(user) }

  describe "#generic_user_data" do
    it "creates different data for user" 

  end

  describe "#status_messages_flavours" do
    let(:user) { FactoryGirl.create(:user_with_aspect) }

    it "creates posts of different types" 

  end

  describe "#status_message_with_activity" do
    it "creates a status message where presented all possible types of activity" 

  end

  describe "#activity" do
    it "creates activity of different kinds" 

  end

  describe "#status_message_with_subscriber" do
    it "creates a status message with a subscriber" 

  end
end

