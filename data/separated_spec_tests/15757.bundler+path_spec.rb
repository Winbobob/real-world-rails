# frozen_string_literal: true

RSpec.describe "bundle install" do
  describe "with --path" do
    before :each do
      build_gem "rack", "1.0.0", :to_system => true do |s|
        s.write "lib/rack.rb", "puts 'FAIL'"
      end

      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
    end

    it "does not use available system gems with bundle --path vendor/bundle", :bundler => "< 2" 


    it "handles paths with regex characters in them" 


    it "prints a warning to let the user know what has happened with bundle --path vendor/bundle" 


    it "disallows --path vendor/bundle --system", :bundler => "< 2" 


    it "remembers to disable system gems after the first time with bundle --path vendor/bundle", :bundler => "< 2" 


    context "with path_relative_to_cwd set to true" do
      before { bundle! "config path_relative_to_cwd true" }

      it "installs the bundle relatively to current working directory", :bundler => "< 2" 


      it "installs the standalone bundle relative to the cwd" 

    end
  end

  describe "when BUNDLE_PATH or the global path config is set" do
    before :each do
      build_lib "rack", "1.0.0", :to_system => true do |s|
        s.write "lib/rack.rb", "raise 'FAIL'"
      end

      gemfile <<-G
        source "file://#{gem_repo1}"
        gem "rack"
      G
    end

    def set_bundle_path(type, location)
      if type == :env
        ENV["BUNDLE_PATH"] = location
      elsif type == :global
        bundle! "config path #{location}", "no-color" => nil
      end
    end

    [:env, :global].each do |type|
      context "when set via #{type}" do
        it "installs gems to a path if one is specified" 


        context "with global_path_appends_ruby_scope set", :bundler => "2" do
          it "installs gems to ." 


          it "installs gems to the path" 


          it "installs gems to the path relative to root when relative" 

        end

        context "with global_path_appends_ruby_scope unset", :bundler => "< 2" do
          it "installs gems to ." 


          it "installs gems to BUNDLE_PATH with #{type}" 


          it "installs gems to BUNDLE_PATH relative to root when relative" 

        end
      end
    end

    it "installs gems to BUNDLE_PATH from .bundle/config" 


    it "sets BUNDLE_PATH as the first argument to bundle install" 


    it "disables system gems when passing a path to install" 


    it "re-installs gems whose extensions have been deleted", :rubygems => ">= 2.3" 

  end

  describe "to a file" do
    before do
      in_app_root do
        FileUtils.touch "bundle"
      end
    end

    it "reports the file exists" 

  end
end

