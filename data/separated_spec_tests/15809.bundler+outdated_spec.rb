# frozen_string_literal: true

RSpec.describe "bundle outdated" do
  before :each do
    build_repo2 do
      build_git "foo", :path => lib_path("foo")
      build_git "zebra", :path => lib_path("zebra")
    end

    install_gemfile <<-G
      source "file://#{gem_repo2}"
      gem "zebra", :git => "#{lib_path("zebra")}"
      gem "foo", :git => "#{lib_path("foo")}"
      gem "activesupport", "2.3.5"
      gem "weakling", "~> 0.0.1"
      gem "duradura", '7.0'
      gem "terranova", '8'
    G
  end

  describe "with no arguments" do
    it "returns a sorted list of outdated gems" 


    it "returns non zero exit status if outdated gems present" 


    it "returns success exit status if no outdated gems present" 


    it "adds gem group to dependency output when repo is updated" 

  end

  describe "with --group option" do
    def test_group_option(group = nil, gems_list_size = 1)
      install_gemfile <<-G
        source "file://#{gem_repo2}"

        gem "weakling", "~> 0.0.1"
        gem "terranova", '8'
        group :development, :test do
          gem "duradura", '7.0'
          gem 'activesupport', '2.3.5'
        end
      G

      update_repo2 do
        build_gem "activesupport", "3.0"
        build_gem "terranova", "9"
        build_gem "duradura", "8.0"
      end

      bundle "outdated --group #{group}"

      # Gem names are one per-line, between "*" and their parenthesized version.
      gem_list = out.split("\n").map {|g| g[/\* (.*) \(/, 1] }.compact
      expect(gem_list).to eq(gem_list.sort)
      expect(gem_list.size).to eq gems_list_size
    end

    it "not outdated gems" 


    it "returns a sorted list of outdated gems from one group => 'default'" 


    it "returns a sorted list of outdated gems from one group => 'development'" 


    it "returns a sorted list of outdated gems from one group => 'test'" 

  end

  describe "with --groups option" do
    it "not outdated gems" 


    it "returns a sorted list of outdated gems by groups" 

  end

  describe "with --local option" do
    it "uses local cache to return a list of outdated gems" 


    it "doesn't hit repo2" 

  end

  shared_examples_for "a minimal output is desired" do
    context "and gems are outdated" do
      before do
        update_repo2 do
          build_gem "activesupport", "3.0"
          build_gem "weakling", "0.2"
        end
      end

      it "outputs a sorted list of outdated gems with a more minimal format" 

    end

    context "and no gems are outdated" do
      it "has empty output" 

    end
  end

  describe "with --parseable option" do
    subject { bundle "outdated --parseable" }

    it_behaves_like "a minimal output is desired"
  end

  describe "with aliased --porcelain option" do
    subject { bundle "outdated --porcelain" }

    it_behaves_like "a minimal output is desired"
  end

  describe "with specified gems" do
    it "returns list of outdated gems" 

  end

  describe "pre-release gems" do
    context "without the --pre option" do
      it "ignores pre-release versions" 

    end

    context "with the --pre option" do
      it "includes pre-release versions" 

    end

    context "when current gem is a pre-release" do
      it "includes the gem" 

    end
  end

  filter_strict_option = Bundler.feature_flag.bundler_2_mode? ? :"filter-strict" : :strict
  describe "with --#{filter_strict_option} option" do
    it "only reports gems that have a newer version that matches the specified dependency version requirements" 


    it "only reports gem dependencies when they can actually be updated" 


    describe "and filter options" do
      it "only reports gems that match requirement and patch filter level" 


      it "only reports gems that match requirement and minor filter level" 


      it "only reports gems that match requirement and major filter level" 

    end
  end

  describe "with invalid gem name" do
    it "returns could not find gem name" 


    it "returns non-zero exit code" 

  end

  it "performs an automatic bundle install" 


  context "after bundle install --deployment", :bundler => "< 2" do
    before do
      install_gemfile <<-G, forgotten_command_line_options(:deployment => true)
        source "file://#{gem_repo2}"

        gem "rack"
        gem "foo"
      G
    end

    it "outputs a helpful message about being in deployment mode" 

  end

  context "after bundle config deployment true" do
    before do
      install_gemfile <<-G
        source "file://#{gem_repo2}"

        gem "rack"
        gem "foo"
      G
      bundle! "config deployment true"
    end

    it "outputs a helpful message about being in deployment mode" 

  end

  context "update available for a gem on a different platform" do
    before do
      install_gemfile <<-G
        source "file://#{gem_repo2}"
        gem "laduradura", '= 5.15.2'
      G
    end

    it "reports that no updates are available" 

  end

  context "update available for a gem on the same platform while multiple platforms used for gem" do
    it "reports that updates are available if the Ruby platform is used" 


    it "reports that updates are available if the JRuby platform is used" 

  end

  shared_examples_for "version update is detected" do
    it "reports that a gem has a newer version" 

  end

  shared_examples_for "major version updates are detected" do
    before do
      update_repo2 do
        build_gem "activesupport", "3.3.5"
        build_gem "weakling", "0.8.0"
      end
    end

    it_behaves_like "version update is detected"
  end

  context "when on a new machine" do
    before do
      simulate_new_machine

      update_git "foo", :path => lib_path("foo")
      update_repo2 do
        build_gem "activesupport", "3.3.5"
        build_gem "weakling", "0.8.0"
      end
    end

    subject { bundle "outdated" }
    it_behaves_like "version update is detected"
  end

  shared_examples_for "minor version updates are detected" do
    before do
      update_repo2 do
        build_gem "activesupport", "2.7.5"
        build_gem "weakling", "2.0.1"
      end
    end

    it_behaves_like "version update is detected"
  end

  shared_examples_for "patch version updates are detected" do
    before do
      update_repo2 do
        build_gem "activesupport", "2.3.7"
        build_gem "weakling", "0.3.1"
      end
    end

    it_behaves_like "version update is detected"
  end

  shared_examples_for "no version updates are detected" do
    it "does not detect any version updates" 

  end

  shared_examples_for "major version is ignored" do
    before do
      update_repo2 do
        build_gem "activesupport", "3.3.5"
        build_gem "weakling", "1.0.1"
      end
    end

    it_behaves_like "no version updates are detected"
  end

  shared_examples_for "minor version is ignored" do
    before do
      update_repo2 do
        build_gem "activesupport", "2.4.5"
        build_gem "weakling", "0.3.1"
      end
    end

    it_behaves_like "no version updates are detected"
  end

  shared_examples_for "patch version is ignored" do
    before do
      update_repo2 do
        build_gem "activesupport", "2.3.6"
        build_gem "weakling", "0.0.4"
      end
    end

    it_behaves_like "no version updates are detected"
  end

  describe "with --filter-major option" do
    subject { bundle "outdated --filter-major" }

    it_behaves_like "major version updates are detected"
    it_behaves_like "minor version is ignored"
    it_behaves_like "patch version is ignored"
  end

  describe "with --filter-minor option" do
    subject { bundle "outdated --filter-minor" }

    it_behaves_like "minor version updates are detected"
    it_behaves_like "major version is ignored"
    it_behaves_like "patch version is ignored"
  end

  describe "with --filter-patch option" do
    subject { bundle "outdated --filter-patch" }

    it_behaves_like "patch version updates are detected"
    it_behaves_like "major version is ignored"
    it_behaves_like "minor version is ignored"
  end

  describe "with --filter-minor --filter-patch options" do
    subject { bundle "outdated --filter-minor --filter-patch" }

    it_behaves_like "minor version updates are detected"
    it_behaves_like "patch version updates are detected"
    it_behaves_like "major version is ignored"
  end

  describe "with --filter-major --filter-minor options" do
    subject { bundle "outdated --filter-major --filter-minor" }

    it_behaves_like "major version updates are detected"
    it_behaves_like "minor version updates are detected"
    it_behaves_like "patch version is ignored"
  end

  describe "with --filter-major --filter-patch options" do
    subject { bundle "outdated --filter-major --filter-patch" }

    it_behaves_like "major version updates are detected"
    it_behaves_like "patch version updates are detected"
    it_behaves_like "minor version is ignored"
  end

  describe "with --filter-major --filter-minor --filter-patch options" do
    subject { bundle "outdated --filter-major --filter-minor --filter-patch" }

    it_behaves_like "major version updates are detected"
    it_behaves_like "minor version updates are detected"
    it_behaves_like "patch version updates are detected"
  end

  context "conservative updates" do
    context "without update-strict" do
      before do
        build_repo4 do
          build_gem "patch", %w[1.0.0 1.0.1]
          build_gem "minor", %w[1.0.0 1.0.1 1.1.0]
          build_gem "major", %w[1.0.0 1.0.1 1.1.0 2.0.0]
        end

        # establish a lockfile set to 1.0.0
        install_gemfile <<-G
        source "file://#{gem_repo4}"
        gem 'patch', '1.0.0'
        gem 'minor', '1.0.0'
        gem 'major', '1.0.0'
        G

        # remove 1.4.3 requirement and bar altogether
        # to setup update specs below
        gemfile <<-G
        source "file://#{gem_repo4}"
        gem 'patch'
        gem 'minor'
        gem 'major'
        G
      end

      it "shows nothing when patching and filtering to minor" 


      it "shows all gems when patching and filtering to patch" 


      it "shows minor and major when updating to minor and filtering to patch and minor" 


      it "shows minor when updating to major and filtering to minor with parseable" 

    end

    context "with update-strict" do
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
          build_gem "qux", %w[1.0.0 1.1.0 2.0.0]
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

      it "shows gems with update-strict updating to patch and filtering to patch" 

    end
  end

  describe "with --only-explicit" do
    it "does not report outdated dependent gems" 

  end
end

