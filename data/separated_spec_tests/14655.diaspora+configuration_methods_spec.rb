# frozen_string_literal: true

describe Configuration::Methods do
  before(:all) do
    @settings = Configurate::Settings.create do
      add_provider Configurate::Provider::Dynamic
      add_provider Configurate::Provider::Env
      extend Configuration::Methods
    end
  end

  describe "#pod_uri" do
    before do
      @settings.environment.url = nil
      @settings.environment.require_ssl = false
      @settings.instance_variable_set(:@pod_uri, nil)
    end

    it "properly parses the pod url" 


    it "adds a trailing slash if there isn't one" 


    it "does not add an extra trailing slash" 


    it "adds http:// on the front if it's missing" 


    it "adds https:// on the front if require_ssl is true" 


    it "changes http to https if require_ssl is true" 


    it "does not add a prefix if there already is https:// on the front" 


    it "returns another instance everytime" 

  end

  describe "#bare_pod_uri" do
    it 'is #pod_uri.authority stripping www.' 

  end

  describe "#url_to" do
    before do
      @settings.environment.url = "https://example.org"
      @settings.instance_variable_set(:@pod_uri, nil)
    end

    it "appends the path to the pod url" 


    it "does not add double slash" 

  end

  describe "#configured_services" do
    it "includes the enabled services only" 

  end

  describe "#show_service" do
    before do
      AppConfig.services.twitter.enable = true
      AppConfig.services.wordpress.authorized = false
      AppConfig.services.wordpress.enable = true
      AppConfig.services.tumblr.authorized = "alice"
      AppConfig.services.tumblr.enable = true
    end

    it "shows service with no authorized key" 


    it "doesn't show service with authorized key false" 


    it "doesn't show service with authorized key not equal to username" 


    it "shows service with authorized key equal to username" 

  end

  describe "#version_string" do
    before do
      @version = double
      allow(@version).to receive(:number).and_return("0.0.0.0")
      allow(@version).to receive(:release?).and_return(true)
      allow(@settings).to receive(:version).and_return(@version)
      allow(@settings).to receive(:git_available?).and_return(false)
      @settings.instance_variable_set(:@version_string, nil)
    end

    it "includes the version" 


    context "with git available" do
      before do
        allow(@settings).to receive(:git_available?).and_return(true)
        allow(@settings).to receive(:git_revision).and_return("1234567890")
      end

      it "includes the 'patchlevel'" 

    end
  end

  describe "#get_redis_options" do
    context "with REDIS_URL set" do
      before do
        ENV["REDIS_URL"] = "redis://yourserver"
      end

      it "uses that" 

    end

    context "with redis set" do
      before do
        ENV["REDIS_URL"] = nil
        @settings.environment.redis = "redis://ourserver"
      end

      it "uses that" 

    end

    context "with a unix socket set" do
      before do
        ENV["REDIS_URL"] = nil
        @settings.environment.redis = "unix:///tmp/redis.sock"
      end

      it "uses that" 

    end
  end

  describe "sidekiq_log" do
    context "with a relative log set" do
      it "joins that with Rails.root" 

    end

    context "with a absolute path" do
      it "just returns that" 

    end
  end
end

