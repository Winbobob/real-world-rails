# frozen_string_literal: true

RSpec.shared_examples "bundle install --standalone" do
  shared_examples "common functionality" do
    it "still makes the gems available to normal bundler" 


    it "generates a bundle/bundler/setup.rb" 


    it "makes the gems available without bundler" 


    it "works on a different system" 

  end

  describe "with simple gems" do
    before do
      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rails"
      G
      bundle! :install, forgotten_command_line_options(:path => bundled_app("bundle")).merge(:standalone => true)
    end

    let(:expected_gems) do
      {
        "actionpack" => "2.3.2",
        "rails" => "2.3.2",
      }
    end

    include_examples "common functionality"
  end

  describe "with gems with native extension" do
    before do
      install_gemfile <<-G, forgotten_command_line_options(:path => bundled_app("bundle")).merge(:standalone => true)
        source "file://#{gem_repo1}"
        gem "very_simple_binary"
      G
    end

    it "generates a bundle/bundler/setup.rb with the proper paths", :rubygems => "2.4" 

  end

  describe "with gem that has an invalid gemspec" do
    before do
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
            s.author      = 'Anonymous'
            s.require_path = [1,2]
          end
        G
      end
      install_gemfile <<-G, forgotten_command_line_options(:path => bundled_app("bundle")).merge(:standalone => true)
        gem "bar", :git => "#{lib_path("bar-1.0")}"
      G
    end

    it "outputs a helpful error message" 

  end

  describe "with a combination of gems and git repos" do
    before do
      build_git "devise", "1.0"

      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rails"
        gem "devise", :git => "#{lib_path("devise-1.0")}"
      G
      bundle! :install, forgotten_command_line_options(:path => bundled_app("bundle")).merge(:standalone => true)
    end

    let(:expected_gems) do
      {
        "actionpack" => "2.3.2",
        "devise" => "1.0",
        "rails" => "2.3.2",
      }
    end

    include_examples "common functionality"
  end

  describe "with groups" do
    before do
      build_git "devise", "1.0"

      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rails"

        group :test do
          gem "rspec"
          gem "rack-test"
        end
      G
      bundle! :install, forgotten_command_line_options(:path => bundled_app("bundle")).merge(:standalone => true)
    end

    let(:expected_gems) do
      {
        "actionpack" => "2.3.2",
        "rails" => "2.3.2",
      }
    end

    include_examples "common functionality"

    it "allows creating a standalone file with limited groups" 


    it "allows --without to limit the groups used in a standalone" 


    it "allows --path to change the location of the standalone bundle", :bundler => "< 2" 


    it "allows --path to change the location of the standalone bundle", :bundler => "2" 


    it "allows remembered --without to limit the groups used in a standalone" 

  end

  describe "with gemcutter's dependency API" do
    let(:source_uri) { "http://localgemserver.test" }

    describe "simple gems" do
      before do
        gemfile <<-G
          source "#{source_uri}"
          gem "rails"
        G
        bundle! :install, forgotten_command_line_options(:path => bundled_app("bundle")).merge(:standalone => true, :artifice => "endpoint")
      end

      let(:expected_gems) do
        {
          "actionpack" => "2.3.2",
          "rails" => "2.3.2",
        }
      end

      include_examples "common functionality"
    end
  end

  describe "with --binstubs", :bundler => "< 2" do
    before do
      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rails"
      G
      bundle! :install, forgotten_command_line_options(:path => bundled_app("bundle")).merge(:standalone => true, :binstubs => true)
    end

    let(:expected_gems) do
      {
        "actionpack" => "2.3.2",
        "rails" => "2.3.2",
      }
    end

    include_examples "common functionality"

    it "creates stubs that use the standalone load path" 


    it "creates stubs that can be executed from anywhere" 


    it "creates stubs that can be symlinked" 


    it "creates stubs with the correct load path" 

  end
end

RSpec.describe "bundle install --standalone" do
  include_examples("bundle install --standalone")
end

RSpec.describe "bundle install --standalone run in a subdirectory" do
  before do
    Dir.chdir(bundled_app("bob").tap(&:mkpath))
  end

  include_examples("bundle install --standalone")
end

