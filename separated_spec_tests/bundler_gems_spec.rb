# frozen_string_literal: true

RSpec.describe "bundle cache" do
  shared_examples_for "when there are only gemsources" do
    before :each do
      gemfile <<-G
        gem 'rack'
      G

      system_gems "rack-1.0.0", :path => :bundle_path
      bundle! :cache
    end

    it "copies the .gem file to vendor/cache" 


    it "uses the cache as a source when installing gems" 


    it "uses the cache as a source when installing gems with --local" 


    it "does not reinstall gems from the cache if they exist on the system" 


    it "does not reinstall gems from the cache if they exist in the bundle" 


    it "creates a lockfile" 

  end

  context "using system gems" do
    before { bundle! "config path.system true" }
    it_behaves_like "when there are only gemsources"
  end

  context "installing into a local path" do
    before { bundle! "config path ./.bundle" }
    it_behaves_like "when there are only gemsources"
  end

  describe "when there is a built-in gem", :ruby => "2.0" do
    before :each do
      build_repo2 do
        build_gem "builtin_gem", "1.0.2"
      end

      build_gem "builtin_gem", "1.0.2", :to_system => true do |s|
        s.summary = "This builtin_gem is bundled with Ruby"
      end

      FileUtils.rm("#{system_gem_path}/cache/builtin_gem-1.0.2.gem")
    end

    it "uses builtin gems when installing to system gems" 


    it "caches remote and builtin gems" 


    it "doesn't make remote request after caching the gem" 


    it "errors if the builtin gem isn't available to cache" 

  end

  describe "when there are also git sources" do
    before do
      build_git "foo"
      system_gems "rack-1.0.0"

      install_gemfile <<-G
        source "file://#{gem_repo1}"
        git "#{lib_path("foo-1.0")}" do
          gem 'foo'
        end
        gem 'rack'
      G
    end

    it "still works" 


    it "should not explode if the lockfile is not present" 

  end

  describe "when previously cached" do
    before :each do
      build_repo2
      install_gemfile <<-G
        source "file://#{gem_repo2}"
        gem "rack"
        gem "actionpack"
      G
      bundle :cache
      expect(cached_gem("rack-1.0.0")).to exist
      expect(cached_gem("actionpack-2.3.2")).to exist
      expect(cached_gem("activesupport-2.3.2")).to exist
    end

    it "re-caches during install" 


    it "adds and removes when gems are updated" 


    it "adds new gems and dependencies" 


    it "removes .gems for removed gems and dependencies" 


    it "removes .gems when gem changes to git source" 


    it "doesn't remove gems that are for another platform" 


    it "doesn't remove gems with mismatched :rubygems_version or :date" 


    it "handles directories and non .gem files in the cache" 


    it "does not say that it is removing gems when it isn't actually doing so" 


    it "does not warn about all if it doesn't have any git/path dependency" 


    it "should install gems with the name bundler in them (that aren't bundler)" 

  end
end

