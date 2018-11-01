# frozen_string_literal: true

describe DiasporaLinkService do
  let(:service) { described_class.new(link) }

  describe "#find_or_fetch_entity" do
    context "when entity is known" do
      let(:post) { FactoryGirl.create(:status_message) }
      let(:link) { "diaspora://#{post.author.diaspora_handle}/post/#{post.guid}" }

      it "returns the entity" 

    end

    context "when entity is unknown" do
      let(:remote_person) { FactoryGirl.create(:person) }
      let(:guid) { "1234567890abcdef" }
      let(:link) { "diaspora://#{remote_person.diaspora_handle}/post/#{guid}" }

      it "fetches entity" 


      it "returns nil when entity is non fetchable" 

    end
  end
end

