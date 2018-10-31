# frozen_string_literal: true

require "rake"
require "bundler/gem_helper"

RSpec.describe Bundler::GemHelper do
  let(:app_name) { "lorem__ipsum" }
  let(:app_path) { bundled_app app_name }
  let(:app_gemspec_path) { app_path.join("#{app_name}.gemspec") }

  before(:each) do
    global_config "BUNDLE_GEM__MIT" => "false", "BUNDLE_GEM__TEST" => "false", "BUNDLE_GEM__COC" => "false"
    bundle "gem #{app_name}"
  end

  context "determining gemspec" do
    subject { Bundler::GemHelper.new(app_path) }

    context "fails" do
      it "when there is no gemspec" 


      it "when there are two gemspecs and the name isn't specified" 

    end

    context "interpolates the name" do
      before do
        # Remove exception that prevents public pushes on older RubyGems versions
        if Gem::Version.new(Gem::VERSION) < Gem::Version.new("2.0")
          content = File.read(app_gemspec_path)
          content.sub!(/raise "RubyGems 2\.0 or newer.*/, "")
          File.open(app_gemspec_path, "w") {|f| f.write(content) }
        end
      end

      it "when there is only one gemspec" 


      it "for a hidden gemspec" 

    end

    it "handles namespaces and converts them to CamelCase" 

  end

  context "gem management" do
    def mock_confirm_message(message)
      expect(Bundler.ui).to receive(:confirm).with(message)
    end

    def mock_build_message(name, version)
      message = "#{name} #{version} built to pkg/#{name}-#{version}.gem."
      mock_confirm_message message
    end

    subject! { Bundler::GemHelper.new(app_path) }
    let(:app_version) { "0.1.0" }
    let(:app_gem_dir) { app_path.join("pkg") }
    let(:app_gem_path) { app_gem_dir.join("#{app_name}-#{app_version}.gem") }
    let(:app_gemspec_content) { remove_push_guard(File.read(app_gemspec_path)) }

    before(:each) do
      content = app_gemspec_content.gsub("TODO: ", "")
      content.sub!(/homepage\s+= ".*"/, 'homepage = ""')
      File.open(app_gemspec_path, "w") {|file| file << content }
    end

    def remove_push_guard(gemspec_content)
      # Remove exception that prevents public pushes on older RubyGems versions
      if Gem::Version.new(Gem::VERSION) < Gem::Version.new("2.0")
        gemspec_content.sub!(/raise "RubyGems 2\.0 or newer.*/, "")
      end
      gemspec_content
    end

    it "uses a shell UI for output" 


    describe "#install" do
      let!(:rake_application) { Rake.application }

      before(:each) do
        Rake.application = Rake::Application.new
      end

      after(:each) do
        Rake.application = rake_application
      end

      context "defines Rake tasks" do
        let(:task_names) do
          %w[build install release release:guard_clean
             release:source_control_push release:rubygem_push]
        end

        context "before installation" do
          it "raises an error with appropriate message" 

        end

        context "after installation" do
          before do
            subject.install
          end

          it "adds Rake tasks successfully" 


          it "provides a way to access the gemspec object" 

        end
      end
    end

    describe "#build_gem" do
      context "when build failed" do
        it "raises an error with appropriate message" 

      end

      context "when build was successful" do
        it "creates .gem file" 

      end
    end

    describe "#install_gem" do
      context "when installation was successful" do
        it "gem is installed" 

      end

      context "when installation fails" do
        it "raises an error with appropriate message" 

      end
    end

    describe "rake release" do
      let!(:rake_application) { Rake.application }

      before(:each) do
        Rake.application = Rake::Application.new
        subject.install
      end

      after(:each) do
        Rake.application = rake_application
      end

      before do
        Dir.chdir(app_path) do
          `git init`
          `git config user.email "you@example.com"`
          `git config user.name "name"`
          `git config commit.gpgsign false`
          `git config push.default simple`
        end

        # silence messages
        allow(Bundler.ui).to receive(:confirm)
        allow(Bundler.ui).to receive(:error)
      end

      context "fails" do
        it "when there are unstaged files" 


        it "when there are uncommitted files" 


        it "when there is no git remote" 

      end

      context "succeeds" do
        before do
          Dir.chdir(gem_repo1) { `git init --bare` }
          Dir.chdir(app_path) do
            `git remote add origin file://#{gem_repo1}`
            `git commit -a -m "initial commit"`
          end
        end

        it "on releasing" 


        it "even if tag already exists" 

      end
    end

    describe "release:rubygem_push" do
      let!(:rake_application) { Rake.application }

      before(:each) do
        Rake.application = Rake::Application.new
        subject.install
        allow(subject).to receive(:sh)
      end

      after(:each) do
        Rake.application = rake_application
      end

      before do
        Dir.chdir(app_path) do
          `git init`
          `git config user.email "you@example.com"`
          `git config user.name "name"`
          `git config push.default simple`
        end

        # silence messages
        allow(Bundler.ui).to receive(:confirm)
        allow(Bundler.ui).to receive(:error)

        credentials = double("credentials", "file?" => true)
        allow(Bundler.user_home).to receive(:join).
          with(".gem/credentials").and_return(credentials)
      end

      describe "success messaging" do
        context "No allowed_push_host set" do
          before do
            allow(subject).to receive(:allowed_push_host).and_return(nil)
          end

          around do |example|
            orig_host = ENV["RUBYGEMS_HOST"]
            ENV["RUBYGEMS_HOST"] = rubygems_host_env

            example.run

            ENV["RUBYGEMS_HOST"] = orig_host
          end

          context "RUBYGEMS_HOST env var is set" do
            let(:rubygems_host_env) { "https://custom.env.gemhost.com" }

            it "should report successful push to the host from the environment" 

          end

          context "RUBYGEMS_HOST env var is not set" do
            let(:rubygems_host_env) { nil }

            it "should report successful push to rubygems.org" 

          end

          context "RUBYGEMS_HOST env var is an empty string" do
            let(:rubygems_host_env) { "" }

            it "should report successful push to rubygems.org" 

          end
        end

        context "allowed_push_host set in gemspec" do
          before do
            allow(subject).to receive(:allowed_push_host).and_return("https://my.gemhost.com")
          end

          it "should report successful push to the allowed gem host" 

        end
      end
    end
  end
end

