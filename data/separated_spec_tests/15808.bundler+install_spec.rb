# frozen_string_literal: true

RSpec.describe "bundle install with gem sources" do
  describe "the simple case" do
    it "prints output and returns if no dependencies are specified" 


    it "does not make a lockfile if the install fails" 


    it "creates a Gemfile.lock" 


    it "does not create ./.bundle by default", :bundler => "< 2" 


    it "does not create ./.bundle by default when installing to system gems" 


    it "creates lock files based on the Gemfile name" 


    it "doesn't delete the lockfile if one already exists" 


    it "does not touch the lockfile if nothing changed" 


    it "fetches gems" 


    it "fetches gems when multiple versions are specified" 


    it "fetches gems when multiple versions are specified take 2" 


    it "raises an appropriate error when gems are specified using symbols" 


    it "pulls in dependencies" 


    it "does the right version" 


    it "does not install the development dependency" 


    it "resolves correctly" 


    it "activates gem correctly according to the resolved gems" 


    it "does not reinstall any gem that is already available locally" 


    it "works when the gemfile specifies gems that only exist in the system" 


    it "prioritizes local gems over remote gems" 


    describe "with a gem that installs multiple platforms" do
      it "installs gems for the local platform as first choice" 


      it "falls back on plain ruby" 


      it "installs gems for java" 


      it "installs gems for windows" 

    end

    describe "doing bundle install foo" do
      before do
        gemfile <<-G
          source "file://#{gem_repo1}"
          gem "rack"
        G
      end

      it "works" 


      it "allows running bundle install --system without deleting foo", :bundler => "< 2" 


      it "allows running bundle install --system after deleting foo", :bundler => "< 2" 

    end

    it "finds gems in multiple sources", :bundler => "< 2" 


    it "gives a useful error if no sources are set" 


    it "creates a Gemfile.lock on a blank Gemfile" 


    context "throws a warning if a gem is added twice in Gemfile" do
      it "without version requirements" 


      it "with same versions" 

    end

    context "throws an error if a gem is added twice in Gemfile" do
      it "when version of one dependency is not specified" 


      it "when different versions of both dependencies are specified" 

    end

    it "gracefully handles error when rubygems server is unavailable" 


    it "fails gracefully when downloading an invalid specification from the full index", :rubygems => "2.5" 


    it "doesn't blow up when the local .bundle/config is empty" 


    it "doesn't blow up when the global .bundle/config is empty" 

  end

  describe "Ruby version in Gemfile.lock" do
    include Bundler::GemHelpers

    context "and using an unsupported Ruby version" do
      it "prints an error" 

    end

    context "and using a supported Ruby version" do
      before do
        install_gemfile <<-G
          ::RUBY_VERSION = '2.1.3'
          ::RUBY_PATCHLEVEL = 100
          ruby '~> 2.1.0'
        G
      end

      it "writes current Ruby version to Gemfile.lock" 


      it "updates Gemfile.lock with updated incompatible ruby version" 

    end
  end

  describe "when Bundler root contains regex chars" do
    before do
      root_dir = tmp("foo[]bar")

      FileUtils.mkdir_p(root_dir)
      in_app_root_custom(root_dir)
    end

    it "doesn't blow up" 

  end

  describe "when requesting a quiet install via --quiet" do
    it "should be quiet" 

  end

  describe "when bundle path does not have write access" do
    before do
      FileUtils.mkdir_p(bundled_app("vendor"))
      gemfile <<-G
        source "file://#{gem_repo1}"
        gem 'rack'
      G
    end

    it "should display a proper message to explain the problem" 

  end

  context "after installing with --standalone" do
    before do
      install_gemfile! <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
      forgotten_command_line_options(:path => "bundle")
      bundle! "install", :standalone => true
    end

    it "includes the standalone path" 

  end

  describe "when bundle install is executed with unencoded authentication" do
    before do
      gemfile <<-G
        source 'https://rubygems.org/'
        gem "."
      G
    end

    it "should display a helpful messag explaining how to fix it" 

  end
end

