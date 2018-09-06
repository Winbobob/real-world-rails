# frozen_string_literal: true

describe PostInteractionPresenter do
  let(:status_message_without_participation) {
    FactoryGirl.create(:status_message_without_participation)
  }
  let(:status_message_with_participations) {
    FactoryGirl.create(:status_message_with_participations, participants: [alice, bob])
  }

  context "with an user" do
    context "without a participation" do
      let(:presenter) { PostInteractionPresenter.new(status_message_without_participation, alice) }

      it "returns an empty array for participations" 

    end

    context "with a participation" do
      let(:presenter) { PostInteractionPresenter.new(status_message_with_participations, alice) }

      it "returns the users own participation only" 

    end
  end

  context "without an user" do
    let(:presenter) { PostInteractionPresenter.new(status_message_with_participations, nil) }

    it "returns an empty array" 

  end
end

