# frozen_string_literal: true

RSpec.describe "bundle binstubs <gem>" do
  context "when the gem exists in the lockfile" do
    it "sets up the binstub" 


    it "does not install other binstubs" 


    it "does install multiple binstubs" 


    it "allows installing all binstubs" 


    it "displays an error when used without any gem" 


    it "displays an error when used with --all and gems" 


    context "when generating bundle binstub outside bundler" do
      it "should abort" 

    end

    context "the bundle binstub" do
      before do
        if system_bundler_version == :bundler
          system_gems :bundler
        elsif system_bundler_version
          build_repo4 do
            build_gem "bundler", system_bundler_version do |s|
              s.executables = "bundle"
              s.bindir = "exe"
              s.write "exe/bundle", "puts %(system bundler #{system_bundler_version}\\n\#{ARGV.inspect})"
            end
          end
          system_gems "bundler-#{system_bundler_version}", :gem_repo => gem_repo4
        end
        build_repo2 do
          build_gem "prints_loaded_gems", "1.0" do |s|
            s.executables = "print_loaded_gems"
            s.bindir = "exe"
            s.write "exe/print_loaded_gems", <<-R
              specs = Gem.loaded_specs.values.reject {|s| Bundler.rubygems.spec_default_gem?(s) }
              puts specs.map(&:full_name).sort.inspect
            R
          end
        end
        install_gemfile! <<-G
          source "file://#{gem_repo2}"
          gem "rack"
          gem "prints_loaded_gems"
        G
        bundle! "binstubs bundler rack prints_loaded_gems"
      end

      let(:system_bundler_version) { Bundler::VERSION }

      it "runs bundler" 


      context "when BUNDLER_VERSION is set" do
        it "runs the correct version of bundler" 

      end

      context "when a lockfile exists with a locked bundler version" do
        it "runs the correct version of bundler when the version is newer" 


        it "runs the correct version of bundler when the version is older" 


        it "runs the correct version of bundler when the version is a pre-release" 

      end

      context "when update --bundler is called" do
        before { lockfile.gsub(system_bundler_version, "1.1.1") }

        it "calls through to the latest bundler version" 


        it "calls through to the explicit bundler version" 

      end

      context "without a lockfile" do
        it "falls back to the latest installed bundler" 

      end

      context "using another binstub" do
        let(:system_bundler_version) { :bundler }
        it "loads all gems" 


        context "when requesting a different bundler version" do
          before { lockfile lockfile.gsub(Bundler::VERSION, "999.999.999") }

          it "attempts to load that version" 

        end
      end
    end

    it "installs binstubs from git gems" 


    it "installs binstubs from path gems" 


    it "sets correct permissions for binstubs" 


    context "when using --shebang" do
      it "sets the specified shebang for the the binstub" 

    end
  end

  context "when the gem doesn't exist" do
    it "displays an error with correct status" 

  end

  context "--path" do
    it "sets the binstubs dir" 


    it "setting is saved for bundle install", :bundler => "< 2" 

  end

  context "with --standalone option" do
    before do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
    end

    it "generates a standalone binstub" 


    it "generates a binstub that does not depend on rubygems or bundler" 


    context "when specified --path option" do
      it "generates a standalone binstub at the given path" 

    end
  end

  context "when the bin already exists" do
    it "doesn't overwrite and warns" 


    context "when using --force" do
      it "overwrites the binstub" 

    end
  end

  context "when the gem has no bins" do
    it "suggests child gems if they have bins" 


    it "works if child gems don't have bins" 


    it "works if the gem has development dependencies" 

  end

  context "when BUNDLE_INSTALL is specified" do
    it "performs an automatic bundle install" 


    it "does nothing when already up to date" 

  end
end

