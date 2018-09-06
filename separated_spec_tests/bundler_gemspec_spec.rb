# frozen_string_literal: true

RSpec.describe "bundle install from an existing gemspec" do
  before(:each) do
    build_repo2 do
      build_gem "bar"
      build_gem "bar-dev"
    end
  end

  it "should install runtime and development dependencies" 


  it "that is hidden should install runtime and development dependencies" 


  it "should handle a list of requirements" 


  it "should raise if there are no gemspecs available" 


  it "should raise if there are too many gemspecs available" 


  it "should pick a specific gemspec" 


  it "should use a specific group for development dependencies" 


  it "should match a lockfile even if the gemspec defines development dependencies" 


  it "should match a lockfile without needing to re-resolve" 


  it "should match a lockfile without needing to re-resolve with development dependencies" 


  it "should match a lockfile on non-ruby platforms with a transitive platform dependency" 


  it "should evaluate the gemspec in its directory" 


  it "allows the gemspec to activate other gems" 


  it "allows conflicts" 


  it "does not break Gem.finish_resolve with conflicts", :rubygems => ">= 2" 


  context "in deployment mode" do
    context "when the lockfile was not updated after a change to the gemspec's dependencies" do
      it "reports that installation failed" 

    end
  end

  context "when child gemspecs conflict with a released gemspec" do
    before do
      # build the "parent" gem that depends on another gem in the same repo
      build_lib "source_conflict", :path => bundled_app do |s|
        s.add_dependency "rack_middleware"
      end

      # build the "child" gem that is the same version as a released gem, but
      # has completely different and conflicting dependency requirements
      build_lib "rack_middleware", "1.0", :path => bundled_app("rack_middleware") do |s|
        s.add_dependency "rack", "1.0" # anything other than 0.9.1
      end
    end

    it "should install the child gemspec's deps" 

  end

  context "with a lockfile and some missing dependencies" do
    let(:source_uri) { "http://localgemserver.test" }

    context "previously bundled for Ruby" do
      let(:platform) { "ruby" }
      let(:explicit_platform) { false }

      before do
        build_lib("foo", :path => tmp.join("foo")) do |s|
          s.add_dependency "rack", "=1.0.0"
        end

        if explicit_platform
          create_file(
            tmp.join("foo", "foo-#{platform}.gemspec"),
            build_spec("foo", "1.0", platform) do
              dep "rack", "=1.0.0"
              @spec.authors = "authors"
              @spec.summary = "summary"
            end.first.to_ruby
          )
        end

        gemfile <<-G
          source "#{source_uri}"
          gemspec :path => "../foo"
        G

        lockfile <<-L
          PATH
            remote: ../foo
            specs:
              foo (1.0)
                rack (= 1.0.0)

          GEM
            remote: #{source_uri}
            specs:
              rack (1.0.0)

          PLATFORMS
            #{generic_local_platform}

          DEPENDENCIES
            foo!

          BUNDLED WITH
             #{Bundler::VERSION}
        L
      end

      context "using JRuby with explicit platform" do
        let(:platform) { "java" }
        let(:explicit_platform) { true }

        it "should install" 

      end

      context "using JRuby" do
        let(:platform) { "java" }

        it "should install" 

      end

      context "using Windows" do
        it "should install" 

      end
    end

    context "bundled for ruby and jruby" do
      let(:platform_specific_type) { :runtime }
      let(:dependency) { "platform_specific" }
      before do
        build_repo2 do
          build_gem "indirect_platform_specific" do |s|
            s.add_runtime_dependency "platform_specific"
          end
        end

        build_lib "foo", :path => "." do |s|
          if platform_specific_type == :runtime
            s.add_runtime_dependency dependency
          elsif platform_specific_type == :development
            s.add_development_dependency dependency
          else
            raise "wrong dependency type #{platform_specific_type}, can only be :development or :runtime"
          end
        end

        %w[ruby jruby].each do |platform|
          simulate_platform(platform) do
            install_gemfile <<-G
              source "file://localhost#{gem_repo2}"
              gemspec
            G
          end
        end
      end

      context "on ruby", :bundler => "< 2" do
        before do
          simulate_platform("ruby")
          bundle :install
        end

        context "as a runtime dependency" do
          it "keeps java dependencies in the lockfile" 

        end

        context "as a development dependency" do
          let(:platform_specific_type) { :development }

          it "keeps java dependencies in the lockfile" 

        end

        context "with an indirect platform-specific development dependency" do
          let(:platform_specific_type) { :development }
          let(:dependency) { "indirect_platform_specific" }

          it "keeps java dependencies in the lockfile" 

        end
      end

      context "on ruby", :bundler => "2" do
        before do
          simulate_platform("ruby")
          bundle :install
        end

        context "as a runtime dependency" do
          it "keeps java dependencies in the lockfile" 

        end

        context "as a development dependency" do
          let(:platform_specific_type) { :development }

          it "keeps java dependencies in the lockfile" 

        end

        context "with an indirect platform-specific development dependency" do
          let(:platform_specific_type) { :development }
          let(:dependency) { "indirect_platform_specific" }

          it "keeps java dependencies in the lockfile" 

        end
      end
    end
  end

  context "with multiple platforms" do
    before do
      build_lib("foo", :path => tmp.join("foo")) do |s|
        s.version = "1.0.0"
        s.add_development_dependency "rack"
        s.write "foo-universal-java.gemspec", build_spec("foo", "1.0.0", "universal-java") {|sj| sj.runtime "rack", "1.0.0" }.first.to_ruby
      end
    end

    it "installs the ruby platform gemspec" 


    it "installs the ruby platform gemspec and skips dev deps with --without development" 

  end
end

