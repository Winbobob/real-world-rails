# frozen_string_literal: true

RSpec.describe "install with --deployment or --frozen" do
  before do
    gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rack"
    G
  end

  context "with CLI flags", :bundler => "< 2" do
    it "fails without a lockfile and says that --deployment requires a lock" 


    it "fails without a lockfile and says that --frozen requires a lock" 


    it "disallows --deployment --system" 


    it "disallows --deployment --path --system" 


    it "works after you try to deploy without a lock" 

  end

  it "still works if you are not in the app directory and specify --gemfile" 


  it "works if you exclude a group with a git gem" 


  it "works when you bundle exec bundle" 


  it "works when using path gems from the same path and the version is specified" 


  it "works when there are credentials in the source URL" 


  it "works with sources given by a block" 


  describe "with an existing lockfile" do
    before do
      bundle "install"
    end

    it "works with the --deployment flag if you didn't change anything", :bundler => "< 2" 


    it "works with the --frozen flag if you didn't change anything", :bundler => "< 2" 


    it "works with BUNDLE_FROZEN if you didn't change anything" 


    it "explodes with the --deployment flag if you make a change and don't check in the lockfile" 


    it "works if a path gem is missing but is in a without group" 


    it "explodes if a path gem is missing" 


    it "can have --frozen set via an environment variable", :bundler => "< 2" 


    it "can have --deployment set via an environment variable" 


    it "can have --frozen set to false via an environment variable" 


    it "explodes with the --frozen flag if you make a change and don't check in the lockfile", :bundler => "< 2" 


    it "explodes if you remove a gem and don't check in the lockfile" 


    it "explodes if you add a source" 


    it "explodes if you unpin a source" 


    it "explodes if you unpin a source, leaving it pinned somewhere else" 


    context "when replacing a host with the same host with credentials" do
      let(:success_message) do
        if Bundler::VERSION.split(".", 2).first == "1"
          "Could not reach host localgemserver.test"
        else
          "Bundle complete!"
        end
      end

      before do
        install_gemfile <<-G
        source "http://user_name:password@localgemserver.test/"
        gem "rack"
        G

        lockfile <<-G
        GEM
          remote: http://localgemserver.test/
          specs:
            rack (1.0.0)

        PLATFORMS
          #{local}

        DEPENDENCIES
          rack
        G
      end

      it "prevents the replace by default" 


      context "when allow_deployment_source_credential_changes is true" do
        before { bundle! "config allow_deployment_source_credential_changes true" }

        it "allows the replace" 

      end

      context "when allow_deployment_source_credential_changes is false" do
        before { bundle! "config allow_deployment_source_credential_changes false" }

        it "prevents the replace" 

      end

      context "when BUNDLE_ALLOW_DEPLOYMENT_SOURCE_CREDENTIAL_CHANGES env var is true" do
        before { ENV["BUNDLE_ALLOW_DEPLOYMENT_SOURCE_CREDENTIAL_CHANGES"] = "true" }

        it "allows the replace" 

      end

      context "when BUNDLE_ALLOW_DEPLOYMENT_SOURCE_CREDENTIAL_CHANGES env var is false" do
        before { ENV["BUNDLE_ALLOW_DEPLOYMENT_SOURCE_CREDENTIAL_CHANGES"] = "false" }

        it "prevents the replace" 

      end
    end

    it "remembers that the bundle is frozen at runtime" 

  end

  context "with path in Gemfile and packed" do
    it "works fine after bundle package and bundle install --local" 

  end
end

