# frozen_string_literal: true

describe NodeInfoPresenter do
  let(:presenter) { NodeInfoPresenter.new("1.0") }
  let(:hash) { presenter.as_json.as_json }

  describe "#as_json" do
    it "works" 

  end

  describe "node info contents" do
    before do
      AppConfig.privacy.statistics.user_counts    = false
      AppConfig.privacy.statistics.post_counts    = false
      AppConfig.privacy.statistics.comment_counts = false
    end

    it "provides generic pod data in json" 


    context "when services are enabled" do
      before do
        AppConfig.services = {
          "twitter"   => {"enable" => true},
          "wordpress" => {"enable" => false},
          "tumblr"    => {
            "enable"     => true,
            "authorized" => false
          }
        }
      end

      it "provides services" 

    end

    context "when some services are set to username authorized" do
      before do
        AppConfig.services = {
          "twitter"   => {"enable" => true},
          "wordpress" => {
            "enable"     => true,
            "authorized" => "alice"
          },
          "tumblr"    => {
            "enable"     => true,
            "authorized" => false
          }
        }
      end

      it "it doesn't list those" 

    end

    context "when counts are enabled" do
      before do
        AppConfig.privacy.statistics.user_counts    = true
        AppConfig.privacy.statistics.post_counts    = true
        AppConfig.privacy.statistics.comment_counts = true
      end

      it "provides generic pod data and counts in json" 

    end

    context "when registrations are closed" do
      before do
        AppConfig.settings.enable_registrations = false
      end

      it "should mark open_registrations to be false" 

    end

    context "when chat is enabled" do
      before do
        AppConfig.chat.enabled = true
      end

      it "should mark the xmppChat metadata as true" 

    end

    context "when camo is enabled" do
      before do
        AppConfig.privacy.camo.proxy_markdown_images = true
        AppConfig.privacy.camo.proxy_opengraph_thumbnails = true
        AppConfig.privacy.camo.proxy_remote_pod_images = true
      end

      it "should list enabled camo options in the metadata as true" 

    end

    context "when admin account is set" do
      before do
        AppConfig.admins.account = "podmin"
      end

      it "adds the admin account username" 

    end

    context "version 2.0" do
      it "provides generic pod data in json" 

    end
  end
end

