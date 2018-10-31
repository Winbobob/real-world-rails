# frozen_string_literal: true

describe Diaspora::Federation::Dispatcher::Public do
  let(:post) { FactoryGirl.create(:status_message, author: alice.person, text: "hello", public: true) }
  let(:comment) { FactoryGirl.create(:comment, author: alice.person, post: post) }

  describe "#dispatch" do
    context "pubsubhubbub" do
      it "delivers public posts to pubsubhubbub" 


      it "does not call pubsubhubbub for comments" 

    end

    context "relay functionality" do
      before do
        AppConfig.relay.outbound.url = "https://relay.iliketoast.net/receive/public"
      end

      it "delivers public post to relay when relay is enabled" 


      it "does not deliver post to relay when relay is disabled" 


      it "does not deliver comments to relay" 

    end

    context "deliver to remote user" do
      let(:encryption_key) { double }
      let(:magic_env) { double }
      let(:magic_env_xml) { double(to_xml: "<diaspora/>") }

      it "queues a public send job" 


      it "does not queue a public send job when no remote recipients specified" 


      it "queues public send job for a specific subscriber" 


      it "only queues a public send job for a active pods" 

    end
  end

  it_behaves_like "a dispatcher"
end

