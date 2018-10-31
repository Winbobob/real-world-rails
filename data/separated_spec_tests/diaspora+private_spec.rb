# frozen_string_literal: true

describe Diaspora::Federation::Dispatcher::Private do
  let(:post) { FactoryGirl.create(:status_message, author: alice.person, text: "hello", public: false) }
  let(:comment) { FactoryGirl.create(:comment, author: alice.person, post: post) }

  before do
    alice.share_with(remote_raphael, alice.aspects.first)
    alice.add_to_streams(post, [alice.aspects.first])
  end

  describe "#dispatch" do
    context "deliver to local user" do
      it "delivers to each user only once" 

    end

    context "deliver to remote user" do
      let(:encryption_key) { double }
      let(:magic_env) { double }
      let(:magic_env_xml) { double }
      let(:json) { "{\"aes_key\": \"...\", \"encrypted_magic_envelope\": \"...\"}" }

      it "queues a private send job" 


      it "does not queue a private send job when no remote recipients specified" 


      it "queues private send job for a specific subscriber" 


      it "only queues a private send job for a active pods" 

    end
  end

  it_behaves_like "a dispatcher"
end

