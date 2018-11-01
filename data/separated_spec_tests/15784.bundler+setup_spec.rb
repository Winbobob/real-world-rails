# frozen_string_literal: true

RSpec.describe "Bundler.setup" do
  describe "with no arguments" do
    it "makes all groups available" 

  end

  describe "when called with groups" do
    before(:each) do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "yard"
        gem "rack", :group => :test
      G
    end

    it "doesn't make all groups available" 


    it "accepts string for group name" 


    it "leaves all groups available if they were already" 


    it "leaves :default available if setup is called twice" 


    it "handles multiple non-additive invocations" 

  end

  context "load order" do
    def clean_load_path(lp)
      without_bundler_load_path = ruby!("puts $LOAD_PATH").split("\n")
      lp = lp - [
        bundler_path.to_s,
        bundler_path.join("gems/bundler-#{Bundler::VERSION}/lib").to_s,
        tmp("rubygems/lib").to_s,
        root.join("../lib").expand_path.to_s,
      ] - without_bundler_load_path
      lp.map! {|p| p.sub(/^#{Regexp.union system_gem_path.to_s, default_bundle_path.to_s}/i, "") }
    end

    it "puts loaded gems after -I and RUBYLIB" 


    it "orders the load path correctly when there are dependencies" 


    it "falls back to order the load path alphabetically for backwards compatibility" 

  end

  it "raises if the Gemfile was not yet installed" 


  it "doesn't create a Gemfile.lock if the setup fails" 


  it "doesn't change the Gemfile.lock if the setup fails" 


  it "makes a Gemfile.lock if setup succeeds" 


  describe "$BUNDLE_GEMFILE" do
    context "user provides an absolute path" do
      it "uses BUNDLE_GEMFILE to locate the gemfile if present" 

    end

    context "an absolute path is not provided" do
      it "uses BUNDLE_GEMFILE to locate the gemfile if present" 

    end
  end

  it "prioritizes gems in BUNDLE_PATH over gems in GEM_HOME" 


  describe "integrate with rubygems" do
    describe "by replacing #gem" do
      before :each do
        install_gemfile <<-G
          source "file://#{gem_repo1}"
          gem "rack", "0.9.1"
        G
      end

      it "replaces #gem but raises when the gem is missing" 


      it "version_requirement is now deprecated in rubygems 1.4.0+ when gem is missing" 


      it "replaces #gem but raises when the version is wrong" 


      it "version_requirement is now deprecated in rubygems 1.4.0+ when the version is wrong" 

    end

    describe "by hiding system gems" do
      before :each do
        system_gems "activesupport-2.3.5"
        install_gemfile <<-G
          source "file://#{gem_repo1}"
          gem "yard"
        G
      end

      it "removes system gems from Gem.source_index" 


      context "when the ruby stdlib is a substring of Gem.path" do
        it "does not reject the stdlib from $LOAD_PATH" 

      end
    end
  end

  describe "with paths" do
    it "activates the gems in the path source" 

  end

  describe "with git" do
    before do
      build_git "rack", "1.0.0"

      gemfile <<-G
        gem "rack", :git => "#{lib_path("rack-1.0.0")}"
      G
    end

    it "provides a useful exception when the git repo is not checked out yet" 


    it "does not hit the git binary if the lockfile is available and up to date" 


    it "provides a good exception if the lockfile is unavailable" 


    it "works even when the cache directory has been deleted" 


    it "does not randomly change the path when specifying --path and the bundle directory becomes read only" 


    it "finds git gem when default bundle path becomes read only" 

  end

  describe "when specifying local override" do
    it "explodes if given path does not exist on runtime" 


    it "explodes if branch is not given on runtime" 


    it "explodes on different branches on runtime" 


    it "explodes on refs with different branches on runtime" 

  end

  describe "when excluding groups" do
    it "doesn't change the resolve if --without is used" 


    it "remembers --without and does not bail on bare Bundler.setup" 


    it "remembers --without and does not include groups passed to Bundler.setup" 

  end

  # Unfortunately, gem_prelude does not record the information about
  # activated gems, so this test cannot work on 1.9 :(
  if RUBY_VERSION < "1.9"
    describe "preactivated gems" do
      it "raises an exception if a pre activated gem conflicts with the bundle" 


      it "version_requirement is now deprecated in rubygems 1.4.0+" 

    end
  end

  # RubyGems returns loaded_from as a string
  it "has loaded_from as a string on all specs" 


  it "does not load all gemspecs", :rubygems => ">= 2.3" 


  it "ignores empty gem paths" 


  describe "$MANPATH" do
    before do
      build_repo4 do
        build_gem "with_man" do |s|
          s.write("man/man1/page.1", "MANPAGE")
        end
      end
    end

    context "when the user has one set" do
      before { ENV["MANPATH"] = "/foo:" }

      it "adds the gem's man dir to the MANPATH" 

    end

    context "when the user does not have one set" do
      before { ENV.delete("MANPATH") }

      it "adds the gem's man dir to the MANPATH" 

    end
  end

  it "should prepend gemspec require paths to $LOAD_PATH in order" 


  it "should clean $LOAD_PATH properly" 


  context "with bundler is located in symlinked GEM_HOME" do
    let(:gem_home) { Dir.mktmpdir }
    let(:symlinked_gem_home) { Tempfile.new("gem_home").path }
    let(:bundler_dir) { File.expand_path("../../..", __FILE__) }
    let(:bundler_lib) { File.join(bundler_dir, "lib") }

    before do
      FileUtils.ln_sf(gem_home, symlinked_gem_home)
      gems_dir = File.join(gem_home, "gems")
      specifications_dir = File.join(gem_home, "specifications")
      Dir.mkdir(gems_dir)
      Dir.mkdir(specifications_dir)

      FileUtils.ln_s(bundler_dir, File.join(gems_dir, "bundler-#{Bundler::VERSION}"))

      gemspec = File.read("#{bundler_dir}/bundler.gemspec").
                sub("Bundler::VERSION", %("#{Bundler::VERSION}"))
      gemspec = gemspec.lines.reject {|line| line =~ %r{lib/bundler/version} }.join

      File.open(File.join(specifications_dir, "bundler.gemspec"), "wb") do |f|
        f.write(gemspec)
      end
    end

    it "should successfully require 'bundler/setup'" 

  end

  it "stubs out Gem.refresh so it does not reveal system gems" 


  describe "when a vendored gem specification uses the :path option" do
    it "should resolve paths relative to the Gemfile" 


    it "should make sure the Bundler.root is really included in the path relative to the Gemfile" 

  end

  describe "with git gems that don't have gemspecs" do
    before :each do
      build_git "no-gemspec", :gemspec => false

      install_gemfile <<-G
        gem "no-gemspec", "1.0", :git => "#{lib_path("no-gemspec-1.0")}"
      G
    end

    it "loads the library via a virtual spec" 

  end

  describe "with bundled and system gems" do
    before :each do
      system_gems "rack-1.0.0"

      install_gemfile <<-G
        source "file://#{gem_repo1}"

        gem "activesupport", "2.3.5"
      G
    end

    it "does not pull in system gems" 


    it "provides a gem method" 


    it "raises an exception if gem is used to invoke a system gem not in the bundle" 


    it "sets GEM_HOME appropriately" 

  end

  describe "with system gems in the bundle" do
    before :each do
      bundle! "config path.system true"
      system_gems "rack-1.0.0"

      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack", "1.0.0"
        gem "activesupport", "2.3.5"
      G
    end

    it "sets GEM_PATH appropriately" 

  end

  describe "with a gemspec that requires other files" do
    before :each do
      build_git "bar", :gemspec => false do |s|
        s.write "lib/bar/version.rb", %(BAR_VERSION = '1.0')
        s.write "bar.gemspec", <<-G
          lib = File.expand_path('../lib/', __FILE__)
          $:.unshift lib unless $:.include?(lib)
          require 'bar/version'

          Gem::Specification.new do |s|
            s.name        = 'bar'
            s.version     = BAR_VERSION
            s.summary     = 'Bar'
            s.files       = Dir["lib/**/*.rb"]
            s.author      = 'no one'
          end
        G
      end

      gemfile <<-G
        gem "bar", :git => "#{lib_path("bar-1.0")}"
      G
    end

    it "evals each gemspec in the context of its parent directory" 


    it "error intelligently if the gemspec has a LoadError" 


    it "evals each gemspec with a binding from the top level" 

  end

  describe "when Bundler is bundled" do
    it "doesn't blow up" 

  end

  describe "when BUNDLED WITH" do
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
      it "does not change the lock or warn" 

    end

    context "is older" do
      it "does not change the lock" 

    end
  end

  describe "when RUBY VERSION" do
    let(:ruby_version) { nil }

    def lock_with(ruby_version = nil)
      lock = <<-L
        GEM
          remote: file://localhost#{gem_repo1}/
          specs:
            rack (1.0.0)

        PLATFORMS
          #{lockfile_platforms}

        DEPENDENCIES
          rack
      L

      if ruby_version
        lock += "\n        RUBY VERSION\n           ruby #{ruby_version}\n"
      end

      lock += <<-L

        BUNDLED WITH
           #{Bundler::VERSION}
      L

      normalize_uri_file(lock)
    end

    before do
      install_gemfile <<-G
        ruby ">= 0"
        source "file://localhost#{gem_repo1}"
        gem "rack"
      G
      lockfile lock_with(ruby_version)
    end

    context "is not present" do
      it "does not change the lock" 

    end

    context "is newer" do
      let(:ruby_version) { "5.5.5" }
      it "does not change the lock or warn" 

    end

    context "is older" do
      let(:ruby_version) { "1.0.0" }
      it "does not change the lock" 

    end
  end

  describe "with gemified standard libraries" do
    it "does not load Psych", :ruby => "~> 2.2" 


    it "does not load openssl" 


    describe "default gem activation" do
      let(:exemptions) do
        if Gem::Version.new(Gem::VERSION) >= Gem::Version.new("2.7") || ENV["RGV"] == "master"
          []
        else
          %w[io-console openssl]
        end << "bundler"
      end

      let(:activation_warning_hack) { strip_whitespace(<<-RUBY) }
        require #{spec_dir.join("support/hax").to_s.dump}
        require "rubygems"

        if Gem::Specification.instance_methods.map(&:to_sym).include?(:activate)
          Gem::Specification.send(:alias_method, :bundler_spec_activate, :activate)
          Gem::Specification.send(:define_method, :activate) do
            unless #{exemptions.inspect}.include?(name)
              warn '-' * 80
              warn "activating \#{full_name}"
              warn *caller
              warn '*' * 80
            end
            bundler_spec_activate
          end
        end
      RUBY

      let(:activation_warning_hack_rubyopt) do
        create_file("activation_warning_hack.rb", activation_warning_hack)
        "-r#{bundled_app("activation_warning_hack.rb")} #{ENV["RUBYOPT"]}"
      end

      let(:code) { strip_whitespace(<<-RUBY) }
        require "pp"
        loaded_specs = Gem.loaded_specs.dup
        #{exemptions.inspect}.each {|s| loaded_specs.delete(s) }
        pp loaded_specs

        # not a default gem, but harmful to have loaded
        open_uri = $LOADED_FEATURES.grep(/open.uri/)
        unless open_uri.empty?
          warn "open_uri: \#{open_uri}"
        end
      RUBY

      it "activates no gems with -rbundler/setup" 


      it "activates no gems with bundle exec" 


      it "activates no gems with bundle exec that is loaded" 


      let(:default_gems) do
        ruby!(<<-RUBY).split("\n")
          if Gem::Specification.is_a?(Enumerable)
            puts Gem::Specification.select(&:default_gem?).map(&:name)
          end
        RUBY
      end

      it "activates newer versions of default gems" 


      it "activates older versions of default gems" 

    end
  end

  describe "after setup" do
    it "allows calling #gem on random objects", :bundler => "< 2" 


    it "keeps Kernel#gem private", :bundler => "2" 


    it "keeps Kernel#require private" 

  end
end

