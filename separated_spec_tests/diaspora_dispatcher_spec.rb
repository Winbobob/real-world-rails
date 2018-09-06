# frozen_string_literal: true

describe Diaspora::Federation::Dispatcher do
  let(:post) { FactoryGirl.create(:status_message, author: alice.person, text: "hello", public: true) }
  let(:opts) { {service_types: "Services::Twitter"} }

  describe ".build" do
    it "creates a public dispatcher for a public post" 


    it "creates a private dispatcher for a private post" 


    it "creates a private dispatcher for object with no public flag" 


    it "uses the parent author as sender for a comment if the parent is local" 


    it "uses the original sender for a comment if the parent is not local" 

  end

  describe ".defer_dispatch" do
    it "queues a job for dispatch" 

  end
end

