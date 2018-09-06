# frozen_string_literal: true

describe PostPresenter do
  let(:status_message) { FactoryGirl.create(:status_message, public: true) }
  let(:status_message_with_poll) { FactoryGirl.create(:status_message_with_poll, public: true) }
  let(:presenter) { PostPresenter.new(status_message, bob) }
  let(:unauthenticated_presenter) { PostPresenter.new(status_message) }

  it "takes a post and an optional user" 


  describe "#as_json" do
    it "works with a user" 


    it "works without a user" 

  end

  context "post with interactions" do
    before do
      bob.like!(status_message)
      bob.reshare!(status_message)
    end

    describe "#with_interactions" do
      it "works with a user" 


      it "works without a user" 

    end

    describe "#with_initial_interactions" do
      it "works with a user" 


      it "works without a user" 

    end
  end

  describe "#user_like" do
    before do
      bob.like!(status_message)
    end

    it "includes the users like" 


    it "is nil if the user is not authenticated" 

  end

  describe "#user_reshare" do
    before do
      bob.reshare!(status_message)
    end

    it "includes the users reshare" 


    it "is nil if the user is not authenticated" 

  end

  describe "#root" do
    it "does not raise if the absolute_root does not exists" 


    it "does not raise if the root does not exists" 

  end

  describe "#title" do
    context "with posts with text" do
      it "delegates to message.title" 

    end

    context "with posts without text" do
      it "displays a messaage with the post class" 

    end
  end

  describe "#poll" do
    it "works without a user" 


    it "returns the answer id of the current user's poll participation" 


    it "returns nil if the user did not participate in a poll" 

  end

  describe "#tags" do
    it "returns the tag of the post" 


    it "returns the tag of the absolute_root of a Reshare" 


    it "does not raise if the root of a reshare does not exist anymore" 

  end

  describe "#description" do
    it "returns the first 1000 chars of the text" 


    it "does not change the message if less or equal 1000 chars" 


    it "does not raise if the root of a reshare does not exist anymore" 

  end

  describe "#build_open_graph_cache" do
    it "returns a dummy og cache if the og cache is missing" 


    context "with an open graph cache" do
      it "delegates to as_api_response" 


      it "returns the open graph cache data" 

    end
  end
end

