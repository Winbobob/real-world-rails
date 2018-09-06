# frozen_string_literal: true

RSpec.describe "the lockfile format", :bundler => "2" do
  include Bundler::GemHelpers

  before { ENV["BUNDLER_SPEC_IGNORE_COMPATIBILITY_GUARD"] = "TRUE" }

  it "generates a simple lockfile for a single source, gem" 


  it "updates the lockfile's bundler version if current ver. is newer" 


  it "does not update the lockfile's bundler version if nothing changed during bundle install" 


  it "updates the lockfile's bundler version if not present" 


  it "outputs a warning if the current is older than lockfile's bundler version" 


  it "errors if the current is a major version older than lockfile's bundler version" 


  it "shows a friendly error when running with a new bundler 2 lockfile" 


  it "warns when updating bundler major version" 


  it "generates a simple lockfile for a single source, gem with dependencies" 


  it "generates a simple lockfile for a single source, gem with a version requirement" 


  it "generates a lockfile without credentials for a configured source" 


  it "generates lockfiles with multiple requirements" 


  it "generates a simple lockfile for a single pinned source, gem with a version requirement", :bundler => "< 2" 


  it "generates a simple lockfile for a single pinned source, gem with a version requirement" 


  it "does not asplode when a platform specific dependency is present and the Gemfile has not been resolved on that platform" 


  it "serializes global git sources" 


  it "generates a lockfile with a ref for a single pinned source, git gem with a branch requirement" 


  it "generates a lockfile with a ref for a single pinned source, git gem with a tag requirement" 


  it "serializes pinned path sources to the lockfile" 


  it "serializes pinned path sources to the lockfile even when packaging" 


  it "sorts serialized sources by type" 


  it "lists gems alphabetically" 


  it "orders dependencies' dependencies in alphabetical order" 


  it "orders dependencies by version" 


  it "does not add the :require option to the lockfile" 


  it "does not add the :group option to the lockfile" 


  it "stores relative paths when the path is provided in a relative fashion and in Gemfile dir" 


  it "stores relative paths when the path is provided in a relative fashion and is above Gemfile dir" 


  it "stores relative paths when the path is provided in an absolute fashion but is relative" 


  it "stores relative paths when the path is provided for gemspec" 


  it "keeps existing platforms in the lockfile" 


  it "persists the spec's platform to the lockfile" 


  it "does not add duplicate gems" 


  it "does not add duplicate dependencies" 


  it "does not add duplicate dependencies with versions" 


  it "does not add duplicate dependencies in different groups" 


  it "raises if two different versions are used" 


  it "raises if two different sources are used" 


  it "works correctly with multiple version dependencies" 


  it "captures the Ruby version in the lockfile" 


  # Some versions of the Bundler 1.1 RC series introduced corrupted
  # lockfiles. There were two major problems:
  #
  # * multiple copies of the same GIT section appeared in the lockfile
  # * when this happened, those sections got multiple copies of gems
  #   in those sections.
  it "fixes corrupted lockfiles" 


  it "raises a helpful error message when the lockfile is missing deps" 


  describe "a line ending" do
    def set_lockfile_mtime_to_known_value
      time = Time.local(2000, 1, 1, 0, 0, 0)
      File.utime(time, time, bundled_app("Gemfile.lock"))
    end
    before(:each) do
      build_repo2

      install_gemfile <<-G
        source "file://localhost#{gem_repo2}"
        gem "rack"
      G
      set_lockfile_mtime_to_known_value
    end

    it "generates Gemfile.lock with \\n line endings" 


    context "during updates" do
      it "preserves Gemfile.lock \\n line endings" 


      it "preserves Gemfile.lock \\n\\r line endings" 

    end

    context "when nothing changes" do
      it "preserves Gemfile.lock \\n line endings" 


      it "preserves Gemfile.lock \\n\\r line endings" 

    end
  end

  it "refuses to install if Gemfile.lock contains conflict markers" 

end

