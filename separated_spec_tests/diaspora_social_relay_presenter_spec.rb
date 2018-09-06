# frozen_string_literal: true

describe SocialRelayPresenter do
  before do
    @presenter = SocialRelayPresenter.new
  end

  describe "#as_json" do
    it "works" 

  end

  describe "#social relay well-known contents" do
    describe "defaults" do
      it "provides valid detault data" 

    end

    describe "pod tags" do
      before do
        AppConfig.relay.inbound.pod_tags = "foo, bar"
        AppConfig.relay.inbound.include_user_tags = false
      end

      it "provides pod tags" 

    end

    describe "user tags" do
      before do
        AppConfig.relay.inbound.pod_tags = ""
        AppConfig.relay.inbound.include_user_tags = true
        ceetag = FactoryGirl.create(:tag, name: "cee")
        lootag = FactoryGirl.create(:tag, name: "loo")
        FactoryGirl.create(:tag_following, user: alice, tag: ceetag)
        FactoryGirl.create(:tag_following, user: alice, tag: lootag)
        alice.last_seen = Time.zone.now - 2.months
        alice.save
      end

      it "provides user tags" 

    end

    describe "pod tags combined with user tags" do
      before do
        AppConfig.relay.inbound.pod_tags = "foo, bar"
        AppConfig.relay.inbound.include_user_tags = true
        ceetag = FactoryGirl.create(:tag, name: "cee")
        lootag = FactoryGirl.create(:tag, name: "loo")
        FactoryGirl.create(:tag_following, user: alice, tag: ceetag)
        FactoryGirl.create(:tag_following, user: alice, tag: lootag)
        alice.last_seen = Time.zone.now - 2.months
        alice.save
      end

      it "provides combined pod and user tags" 

    end

    describe "user tags for inactive user" do
      before do
        AppConfig.relay.inbound.pod_tags = ""
        AppConfig.relay.inbound.include_user_tags = true
        ceetag = FactoryGirl.create(:tag, name: "cee")
        lootag = FactoryGirl.create(:tag, name: "loo")
        FactoryGirl.create(:tag_following, user: alice, tag: ceetag)
        FactoryGirl.create(:tag_following, user: alice, tag: lootag)
        alice.last_seen = Time.zone.now - 8.months
        alice.save
      end

      it "ignores user tags" 

    end

    describe "when scope is all" do
      before do
        AppConfig.relay.inbound.scope = "all"
        AppConfig.relay.inbound.pod_tags = "foo,bar"
        AppConfig.relay.inbound.include_user_tags = true
        ceetag = FactoryGirl.create(:tag, name: "cee")
        FactoryGirl.create(:tag_following, user: alice, tag: ceetag)
      end

      it "provides empty tags list" 

    end
  end
end

