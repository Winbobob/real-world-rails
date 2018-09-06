# frozen_string_literal: true

RSpec.describe "bundle clean" do
  def should_have_gems(*gems)
    gems.each do |g|
      expect(vendored_gems("gems/#{g}")).to exist
      expect(vendored_gems("specifications/#{g}.gemspec")).to exist
      expect(vendored_gems("cache/#{g}.gem")).to exist
    end
  end

  def should_not_have_gems(*gems)
    gems.each do |g|
      expect(vendored_gems("gems/#{g}")).not_to exist
      expect(vendored_gems("specifications/#{g}.gemspec")).not_to exist
      expect(vendored_gems("cache/#{g}.gem")).not_to exist
    end
  end

  it "removes unused gems that are different" 


  it "removes old version of gem if unused" 


  it "removes new version of gem if unused" 


  it "removes gems in bundle without groups" 


  it "does not remove cached git dir if it's being used" 


  it "removes unused git gems" 


  it "removes old git gems" 


  it "does not remove nested gems in a git repo" 


  it "does not remove git sources that are in without groups" 


  it "does not blow up when using without groups" 


  it "displays an error when used without --path" 


  # handling bundle clean upgrade path from the pre's
  it "removes .gem/.gemspec file even if there's no corresponding gem dir" 


  it "does not call clean automatically when using system gems" 


  it "--clean should override the bundle setting on install", :bundler => "< 2" 


  it "--clean should override the bundle setting on update", :bundler => "< 2" 


  it "automatically cleans when path has not been set", :bundler => "2" 


  it "does not clean automatically on --path" 


  it "does not clean on bundle update with --path" 


  it "does not clean on bundle update when using --system" 


  it "cleans system gems when --force is used" 


  describe "when missing permissions" do
    before { ENV["BUNDLE_PATH__SYSTEM"] = "true" }
    let(:system_cache_path) { system_gem_path("cache") }
    after do
      FileUtils.chmod(0o755, system_cache_path)
    end
    it "returns a helpful error message" 

  end

  it "cleans git gems with a 7 length git revision" 


  it "when using --force on system gems, it doesn't remove binaries" 


  it "doesn't blow up on path gems without a .gempsec" 


  it "doesn't remove gems in dry-run mode with path set" 


  it "doesn't remove gems in dry-run mode with no path set" 


  it "doesn't store dry run as a config setting" 


  it "performs an automatic bundle install" 


  it "doesn't remove extensions artifacts from bundled git gems after clean", :rubygems => "2.2" 


  it "removes extension directories", :rubygems => "2.2" 

end

