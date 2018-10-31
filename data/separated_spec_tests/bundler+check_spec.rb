# frozen_string_literal: true

RSpec.describe "bundle check" do
  it "returns success when the Gemfile is satisfied" 


  it "works with the --gemfile flag when not in the directory" 


  it "creates a Gemfile.lock by default if one does not exist" 


  it "does not create a Gemfile.lock if --dry-run was passed" 


  it "prints a generic error if the missing gems are unresolvable" 


  it "prints a generic error if a Gemfile.lock does not exist and a toplevel dependency does not exist" 


  it "prints a generic message if you changed your lockfile" 


  it "remembers --without option from install", :bundler => "< 2" 


  it "uses the without setting" 


  it "ensures that gems are actually installed and not just cached" 


  it "ignores missing gems restricted to other platforms" 


  it "works with env conditionals" 


  it "outputs an error when the default Gemfile is not found" 


  it "does not output fatal error message" 


  it "should not crash when called multiple times on a new machine" 


  it "fails when there's no lock file and frozen is set" 


  context "--path", :bundler => "< 2" do
    before do
      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rails"
      G
      bundle "install --path vendor/bundle"

      FileUtils.rm_rf(bundled_app(".bundle"))
    end

    it "returns success" 


    it "should write to .bundle/config", :bundler => "< 2" 

  end

  context "--path vendor/bundle after installing gems in the default directory" do
    it "returns false" 

  end

  describe "when locked" do
    before :each do
      system_gems "rack-1.0.0"
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack", "1.0"
      G
    end

    it "returns success when the Gemfile is satisfied" 


    it "shows what is missing with the current Gemfile if it is not satisfied" 

  end

  describe "BUNDLED WITH" do
    def lock_with(bundler_version = nil)
      lock = <<-L
        GEM
          remote: file:#{gem_repo1}/
          specs:
            rack (1.0.0)

        PLATFORMS
          #{lockfile_platforms}

        DEPENDENCIES
          rack
      L

      if bundler_version
        lock += "\n        BUNDLED WITH\n           #{bundler_version}\n"
      end

      lock
    end

    before do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
    end

    context "is not present" do
      it "does not change the lock" 

    end

    context "is newer" do
      it "does not change the lock but warns" 

    end

    context "is older" do
      it "does not change the lock" 

    end
  end
end

