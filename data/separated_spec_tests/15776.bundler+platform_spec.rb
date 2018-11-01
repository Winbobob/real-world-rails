# frozen_string_literal: true

RSpec.describe "bundle platform" do
  context "without flags" do
    let(:bundle_platform_platforms_string) do
      platforms = [rb]
      platforms.unshift(specific_local_platform) if Bundler.feature_flag.bundler_2_mode?
      platforms.map {|pl| "* #{pl}" }.join("\n")
    end

    it "returns all the output" 


    it "returns all the output including the patchlevel" 


    it "doesn't print ruby version requirement if it isn't specified" 


    it "doesn't match the ruby version requirement" 

  end

  context "--ruby" do
    it "returns ruby version when explicit" 


    it "defaults to MRI" 


    it "handles jruby" 


    it "handles rbx" 


    it "handles truffleruby", :rubygems => ">= 2.1.0" 


    it "raises an error if engine is used but engine version is not" 


    it "raises an error if engine_version is used but engine is not" 


    it "raises an error if engine version doesn't match ruby version for MRI" 


    it "should print if no ruby version is specified" 


    it "handles when there is a locked requirement" 


    it "handles when there is a requirement in the gemfile" 


    it "handles when there are multiple requirements in the gemfile" 

  end

  let(:ruby_version_correct) { "ruby \"#{RUBY_VERSION}\", :engine => \"#{local_ruby_engine}\", :engine_version => \"#{local_engine_version}\"" }
  let(:ruby_version_correct_engineless) { "ruby \"#{RUBY_VERSION}\"" }
  let(:ruby_version_correct_patchlevel) { "#{ruby_version_correct}, :patchlevel => '#{RUBY_PATCHLEVEL}'" }
  let(:ruby_version_incorrect) { "ruby \"#{not_local_ruby_version}\", :engine => \"#{local_ruby_engine}\", :engine_version => \"#{not_local_ruby_version}\"" }
  let(:engine_incorrect) { "ruby \"#{RUBY_VERSION}\", :engine => \"#{not_local_tag}\", :engine_version => \"#{RUBY_VERSION}\"" }
  let(:engine_version_incorrect) { "ruby \"#{RUBY_VERSION}\", :engine => \"#{local_ruby_engine}\", :engine_version => \"#{not_local_engine_version}\"" }
  let(:patchlevel_incorrect) { "#{ruby_version_correct}, :patchlevel => '#{not_local_patchlevel}'" }
  let(:patchlevel_fixnum) { "#{ruby_version_correct}, :patchlevel => #{RUBY_PATCHLEVEL}1" }

  def should_be_ruby_version_incorrect
    expect(exitstatus).to eq(18) if exitstatus
    expect(out).to be_include("Your Ruby version is #{RUBY_VERSION}, but your Gemfile specified #{not_local_ruby_version}")
  end

  def should_be_engine_incorrect
    expect(exitstatus).to eq(18) if exitstatus
    expect(out).to be_include("Your Ruby engine is #{local_ruby_engine}, but your Gemfile specified #{not_local_tag}")
  end

  def should_be_engine_version_incorrect
    expect(exitstatus).to eq(18) if exitstatus
    expect(out).to be_include("Your #{local_ruby_engine} version is #{local_engine_version}, but your Gemfile specified #{local_ruby_engine} #{not_local_engine_version}")
  end

  def should_be_patchlevel_incorrect
    expect(exitstatus).to eq(18) if exitstatus
    expect(out).to be_include("Your Ruby patchlevel is #{RUBY_PATCHLEVEL}, but your Gemfile specified #{not_local_patchlevel}")
  end

  def should_be_patchlevel_fixnum
    expect(exitstatus).to eq(18) if exitstatus
    expect(out).to be_include("The Ruby patchlevel in your Gemfile must be a string")
  end

  context "bundle install" do
    it "installs fine when the ruby version matches" 


    it "installs fine with any engine" 


    it "installs fine when the patchlevel matches" 


    it "doesn't install when the ruby version doesn't match" 


    it "doesn't install when engine doesn't match" 


    it "doesn't install when engine version doesn't match" 


    it "doesn't install when patchlevel doesn't match" 

  end

  context "bundle check" do
    it "checks fine when the ruby version matches" 


    it "checks fine with any engine" 


    it "fails when ruby version doesn't match" 


    it "fails when engine doesn't match" 


    it "fails when engine version doesn't match" 


    it "fails when patchlevel doesn't match" 

  end

  context "bundle update" do
    before do
      build_repo2

      install_gemfile <<-G
        source "file://#{gem_repo2}"
        gem "activesupport"
        gem "rack-obama"
      G
    end

    it "updates successfully when the ruby version matches" 


    it "updates fine with any engine" 


    it "fails when ruby version doesn't match" 


    it "fails when ruby engine doesn't match" 


    it "fails when ruby engine version doesn't match" 


    it "fails when patchlevel doesn't match" 

  end

  context "bundle info" do
    before do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rails"
      G
    end

    it "prints path if ruby version is correct" 


    it "prints path if ruby version is correct for any engine" 


    it "fails if ruby version doesn't match", :bundler => "< 2" 


    it "fails if engine doesn't match", :bundler => "< 2" 


    it "fails if engine version doesn't match", :bundler => "< 2" 


    it "fails when patchlevel doesn't match", :bundler => "< 2" 

  end

  context "bundle cache" do
    before do
      install_gemfile <<-G
        source "file:#{gem_repo1}"
        gem 'rack'
      G
    end

    it "copies the .gem file to vendor/cache when ruby version matches" 


    it "copies the .gem file to vendor/cache when ruby version matches for any engine" 


    it "fails if the ruby version doesn't match" 


    it "fails if the engine doesn't match" 


    it "fails if the engine version doesn't match" 


    it "fails when patchlevel doesn't match" 

  end

  context "bundle pack" do
    before do
      install_gemfile! <<-G
        source "file:#{gem_repo1}"
        gem 'rack'
      G
    end

    it "copies the .gem file to vendor/cache when ruby version matches" 


    it "copies the .gem file to vendor/cache when ruby version matches any engine" 


    it "fails if the ruby version doesn't match" 


    it "fails if the engine doesn't match" 


    it "fails if the engine version doesn't match" 


    it "fails when patchlevel doesn't match" 

  end

  context "bundle exec" do
    before do
      ENV["BUNDLER_FORCE_TTY"] = "true"
      system_gems "rack-1.0.0", "rack-0.9.1", :path => :bundle_path
    end

    it "activates the correct gem when ruby version matches" 


    it "activates the correct gem when ruby version matches any engine" 


    it "fails when the ruby version doesn't match" 


    it "fails when the engine doesn't match" 


    # it "fails when the engine version doesn't match" do
    #   simulate_ruby_engine "jruby" do
    #     gemfile <<-G
    #       gem "rack", "0.9.1"
    #
    #       #{engine_version_incorrect}
    #     G
    #
    #     bundle "exec rackup"
    #     should_be_engine_version_incorrect
    #   end
    # end

    it "fails when patchlevel doesn't match" 

  end

  context "bundle console", :bundler => "< 2" do
    before do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"
        gem "activesupport", :group => :test
        gem "rack_middleware", :group => :development
      G
    end

    it "starts IRB with the default group loaded when ruby version matches" 


    it "starts IRB with the default group loaded when ruby version matches any engine" 


    it "fails when ruby version doesn't match" 


    it "fails when engine doesn't match" 


    it "fails when engine version doesn't match" 


    it "fails when patchlevel doesn't match" 

  end

  context "Bundler.setup" do
    before do
      install_gemfile <<-G
        source "file://#{gem_repo1}"
        gem "yard"
        gem "rack", :group => :test
      G

      ENV["BUNDLER_FORCE_TTY"] = "true"
    end

    it "makes a Gemfile.lock if setup succeeds" 


    it "makes a Gemfile.lock if setup succeeds for any engine" 


    it "fails when ruby version doesn't match" 


    it "fails when engine doesn't match" 


    it "fails when engine version doesn't match" 


    it "fails when patchlevel doesn't match" 

  end

  context "bundle outdated" do
    before do
      build_repo2 do
        build_git "foo", :path => lib_path("foo")
      end

      install_gemfile <<-G
        source "file://#{gem_repo2}"
        gem "activesupport", "2.3.5"
        gem "foo", :git => "#{lib_path("foo")}"
      G
    end

    it "returns list of outdated gems when the ruby version matches" 


    it "returns list of outdated gems when the ruby version matches for any engine" 


    it "fails when the ruby version doesn't match" 


    it "fails when the engine doesn't match" 


    it "fails when the engine version doesn't match" 


    it "fails when the patchlevel doesn't match" 


    it "fails when the patchlevel is a fixnum" 

  end
end

