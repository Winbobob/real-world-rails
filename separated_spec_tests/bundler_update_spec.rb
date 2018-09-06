# frozen_string_literal: true

RSpec.describe "bundle update" do
  before :each do
    build_repo2

    install_gemfile <<-G
      source "file://#{gem_repo2}"
      gem "activesupport"
      gem "rack-obama"
    G
  end

  describe "with no arguments", :bundler => "< 2" do
    it "updates the entire bundle" 


    it "doesn't delete the Gemfile.lock file if something goes wrong" 

  end

  describe "with --all", :bundler => "2" do
    it "updates the entire bundle" 


    it "doesn't delete the Gemfile.lock file if something goes wrong" 

  end

  describe "with --gemfile" do
    it "creates lock files based on the Gemfile name" 

  end

  context "when update_requires_all_flag is set" do
    before { bundle! "config update_requires_all_flag true" }

    it "errors when passed nothing" 


    it "errors when passed --all and another option" 


    it "updates everything when passed --all" 

  end

  describe "--quiet argument" do
    it "hides UI messages" 

  end

  describe "with a top level dependency" do
    it "unlocks all child dependencies that are unrelated to other locked dependencies" 

  end

  describe "with an unknown dependency" do
    it "should inform the user" 

    it "should suggest alternatives" 

  end

  describe "with a child dependency" do
    it "should update the child dependency" 

  end

  describe "when a possible resolve requires an older version of a locked gem" do
    context "and only_update_to_newer_versions is set" do
      before do
        bundle! "config only_update_to_newer_versions true"
      end
      it "does not go to an older version" 

    end
  end

  describe "with --local option" do
    it "doesn't hit repo2" 

  end

  describe "with --group option" do
    it "should update only specified group gems" 


    context "when there is a source with the same name as a gem in a group" do
      before :each do
        build_git "foo", :path => lib_path("activesupport")
        install_gemfile <<-G
          source "file://#{gem_repo2}"
          gem "activesupport", :group => :development
          gem "foo", :git => "#{lib_path("activesupport")}"
        G
      end

      it "should not update the gems from that source" 

    end

    context "when bundler itself is a transitive dependency" do
      it "executes without error" 

    end
  end

  describe "in a frozen bundle" do
    it "should fail loudly", :bundler => "< 2" 


    it "should suggest different command when frozen is set globally", :bundler => "< 2" 


    it "should suggest different command when frozen is set globally", :bundler => "2" 

  end

  describe "with --source option" do
    it "should not update gems not included in the source that happen to have the same name", :bundler => "< 2" 


    it "should not update gems not included in the source that happen to have the same name", :bundler => "2" 


    context "with unlock_source_unlocks_spec set to false" do
      before { bundle! "config unlock_source_unlocks_spec false" }

      it "should not update gems not included in the source that happen to have the same name" 

    end
  end

  context "when there is a child dependency that is also in the gemfile" do
    before do
      build_repo2 do
        build_gem "fred", "1.0"
        build_gem "harry", "1.0" do |s|
          s.add_dependency "fred"
        end
      end

      install_gemfile <<-G
        source "file://#{gem_repo2}"
        gem "harry"
        gem "fred"
      G
    end

    it "should not update the child dependencies of a gem that has the same name as the source", :bundler => "< 2" 


    it "should not update the child dependencies of a gem that has the same name as the source", :bundler => "2" 

  end

  context "when there is a child dependency that appears elsewhere in the dependency graph" do
    before do
      build_repo2 do
        build_gem "fred", "1.0" do |s|
          s.add_dependency "george"
        end
        build_gem "george", "1.0"
        build_gem "harry", "1.0" do |s|
          s.add_dependency "george"
        end
      end

      install_gemfile <<-G
        source "file://#{gem_repo2}"
        gem "harry"
        gem "fred"
      G
    end

    it "should not update the child dependencies of a gem that has the same name as the source", :bundler => "< 2" 


    it "should not update the child dependencies of a gem that has the same name as the source", :bundler => "2" 

  end
end

RSpec.describe "bundle update in more complicated situations" do
  before :each do
    build_repo2
  end

  it "will eagerly unlock dependencies of a specified gem" 


  it "will warn when some explicitly updated gems are not updated" 


  it "will update only from pinned source" 


  context "when the lockfile is for a different platform" do
    before do
      build_repo4 do
        build_gem("a", "0.9")
        build_gem("a", "0.9") {|s| s.platform = "java" }
        build_gem("a", "1.1")
        build_gem("a", "1.1") {|s| s.platform = "java" }
      end

      gemfile <<-G
        source "file://#{gem_repo4}"
        gem "a"
      G

      lockfile <<-L
        GEM
          remote: file://#{gem_repo4}
          specs:
            a (0.9-java)

        PLATFORMS
          java

        DEPENDENCIES
          a
      L

      simulate_platform linux
    end

    it "allows updating" 


    it "allows updating a specific gem" 

  end
end

RSpec.describe "bundle update without a Gemfile.lock" do
  it "should not explode" 

end

RSpec.describe "bundle update when a gem depends on a newer version of bundler" do
  before(:each) do
    build_repo2 do
      build_gem "rails", "3.0.1" do |s|
        s.add_dependency "bundler", Bundler::VERSION.succ
      end
    end

    gemfile <<-G
      source "file://#{gem_repo2}"
      gem "rails", "3.0.1"
    G
  end

  it "should explain that bundler conflicted", :bundler => "< 2" 


  it "should warn that the newer version of Bundler would conflict", :bundler => "2" 

end

RSpec.describe "bundle update" do
  it "shows the previous version of the gem when updated from rubygems source", :bundler => "< 2" 


  context "with suppress_install_using_messages set" do
    before { bundle! "config suppress_install_using_messages true" }

    it "only prints `Using` for versions that have changed" 

  end

  it "shows error message when Gemfile.lock is not preset and gem is specified" 

end

RSpec.describe "bundle update --ruby" do
  before do
    install_gemfile <<-G
        ::RUBY_VERSION = '2.1.3'
        ::RUBY_PATCHLEVEL = 100
        ruby '~> 2.1.0'
    G
    bundle "update --ruby"
  end

  context "when the Gemfile removes the ruby" do
    before do
      install_gemfile <<-G
          ::RUBY_VERSION = '2.1.4'
          ::RUBY_PATCHLEVEL = 222
      G
    end
    it "removes the Ruby from the Gemfile.lock" 

  end

  context "when the Gemfile specified an updated Ruby version" do
    before do
      install_gemfile <<-G
          ::RUBY_VERSION = '2.1.4'
          ::RUBY_PATCHLEVEL = 222
          ruby '~> 2.1.0'
      G
    end
    it "updates the Gemfile.lock with the latest version" 

  end

  context "when a different Ruby is being used than has been versioned" do
    before do
      install_gemfile <<-G
          ::RUBY_VERSION = '2.2.2'
          ::RUBY_PATCHLEVEL = 505
          ruby '~> 2.1.0'
      G
    end
    it "shows a helpful error message" 

  end

  context "when updating Ruby version and Gemfile `ruby`" do
    before do
      install_gemfile <<-G
          ::RUBY_VERSION = '1.8.3'
          ::RUBY_PATCHLEVEL = 55
          ruby '~> 1.8.0'
      G
    end
    it "updates the Gemfile.lock with the latest version" 

  end
end

RSpec.describe "bundle update --bundler" do
  it "updates the bundler version in the lockfile without re-resolving" 

end

# these specs are slow and focus on integration and therefore are not exhaustive. unit specs elsewhere handle that.
RSpec.describe "bundle update conservative" do
  context "patch and minor options" do
    before do
      build_repo4 do
        build_gem "foo", %w[1.4.3 1.4.4] do |s|
          s.add_dependency "bar", "~> 2.0"
        end
        build_gem "foo", %w[1.4.5 1.5.0] do |s|
          s.add_dependency "bar", "~> 2.1"
        end
        build_gem "foo", %w[1.5.1] do |s|
          s.add_dependency "bar", "~> 3.0"
        end
        build_gem "bar", %w[2.0.3 2.0.4 2.0.5 2.1.0 2.1.1 3.0.0]
        build_gem "qux", %w[1.0.0 1.0.1 1.1.0 2.0.0]
      end

      # establish a lockfile set to 1.4.3
      install_gemfile <<-G
        source "file://#{gem_repo4}"
        gem 'foo', '1.4.3'
        gem 'bar', '2.0.3'
        gem 'qux', '1.0.0'
      G

      # remove 1.4.3 requirement and bar altogether
      # to setup update specs below
      gemfile <<-G
        source "file://#{gem_repo4}"
        gem 'foo'
        gem 'qux'
      G
    end

    context "patch preferred" do
      it "single gem updates dependent gem to minor" 


      it "update all" 

    end

    context "minor preferred" do
      it "single gem updates dependent gem to major" 

    end

    context "strict" do
      it "patch preferred" 


      it "minor preferred" 

    end
  end

  context "eager unlocking" do
    before do
      build_repo4 do
        build_gem "isolated_owner", %w[1.0.1 1.0.2] do |s|
          s.add_dependency "isolated_dep", "~> 2.0"
        end
        build_gem "isolated_dep", %w[2.0.1 2.0.2]

        build_gem "shared_owner_a", %w[3.0.1 3.0.2] do |s|
          s.add_dependency "shared_dep", "~> 5.0"
        end
        build_gem "shared_owner_b", %w[4.0.1 4.0.2] do |s|
          s.add_dependency "shared_dep", "~> 5.0"
        end
        build_gem "shared_dep", %w[5.0.1 5.0.2]
      end

      gemfile <<-G
        source "file://#{gem_repo4}"
        gem 'isolated_owner'

        gem 'shared_owner_a'
        gem 'shared_owner_b'
      G

      lockfile <<-L
        GEM
          remote: file://#{gem_repo4}
          specs:
            isolated_dep (2.0.1)
            isolated_owner (1.0.1)
              isolated_dep (~> 2.0)
            shared_dep (5.0.1)
            shared_owner_a (3.0.1)
              shared_dep (~> 5.0)
            shared_owner_b (4.0.1)
              shared_dep (~> 5.0)

        PLATFORMS
          ruby

        DEPENDENCIES
          shared_owner_a
          shared_owner_b
          isolated_owner

        BUNDLED WITH
           1.13.0
      L
    end

    it "should eagerly unlock isolated dependency" 


    it "should eagerly unlock shared dependency" 


    it "should not eagerly unlock with --conservative" 


    it "should match bundle install conservative update behavior when not eagerly unlocking" 

  end

  context "error handling" do
    before do
      gemfile ""
    end

    it "raises if too many flags are provided" 

  end
end

