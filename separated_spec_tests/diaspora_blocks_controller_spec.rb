# frozen_string_literal: true

describe BlocksController, :type => :controller do
  before do
    sign_in alice
  end

  describe "#create" do
    it "creates a block" 


    it "responds with 204" 


    it "calls #send_message" 

  end

  describe "#destroy" do
    before do
      @block = alice.blocks.create(:person => eve.person)
    end

    it "redirects back" 


    it "notifies the user" 


    it "sends a message" 


    it "responds with 204 with json" 


    it "redirects back on mobile" 


    it "removes a block" 


    it "handles when the block to delete doesn't exist" 

  end

  describe "#send_message" do
    before do
      allow(@controller).to receive(:current_user).and_return(alice)
    end

    it "calls disconnect if there is a contact for a given user" 


    it "queues a message with the block if the person is remote and there is no contact for a given user" 


    it "does nothing if the person is local and there is no contact for a given user" 

  end
end

