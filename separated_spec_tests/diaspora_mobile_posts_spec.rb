# frozen_string_literal: true

describe PostsController, type: :request do
  context "with a poll" do
    let(:sm) { FactoryGirl.build(:status_message_with_poll, public: true) }

    it "displays the poll" 


    it "displays the correct percentage for the answers" 

  end

  context "with a location" do
    let(:sm) { FactoryGirl.build(:status_message_with_location, public: true) }

    it "displays the location" 

  end
end

