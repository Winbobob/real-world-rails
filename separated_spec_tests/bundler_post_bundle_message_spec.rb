# frozen_string_literal: true

RSpec.describe "post bundle message" do
  before :each do
    gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rack"
      gem "activesupport", "2.3.5", :group => [:emo, :test]
      group :test do
        gem "rspec"
      end
      gem "rack-obama", :group => :obama
    G
  end

  let(:bundle_path)                { "./.bundle" }
  let(:bundle_show_system_message) { "Use `bundle info [gemname]` to see where a bundled gem is installed." }
  let(:bundle_show_path_message)   { "Bundled gems are installed into `#{bundle_path}`" }
  let(:bundle_complete_message)    { "Bundle complete!" }
  let(:bundle_updated_message)     { "Bundle updated!" }
  let(:installed_gems_stats)       { "4 Gemfile dependencies, 5 gems now installed." }
  let(:bundle_show_message)        { Bundler::VERSION.split(".").first.to_i < 2 ? bundle_show_system_message : bundle_show_path_message }

  describe "for fresh bundle install" do
    it "without any options" 


    it "with --without one group" 


    it "with --without two groups" 


    it "with --without more groups" 


    describe "with --path and" do
      let(:bundle_path) { "./vendor" }

      it "without any options" 


      it "with --without one group" 


      it "with --without two groups" 


      it "with --without more groups" 


      it "with an absolute --path inside the cwd" 


      it "with an absolute --path outside the cwd" 

    end

    describe "with misspelled or non-existent gem name" do
      it "should report a helpful error message", :bundler => "< 2" 


      it "should report a helpful error message", :bundler => "2" 


      it "should report a helpful error message with reference to cache if available" 

    end
  end

  describe "for second bundle install run" do
    it "without any options" 


    it "with --without one group" 


    it "with --without two groups" 


    it "with --without more groups" 

  end

  describe "for bundle update" do
    it "without any options" 


    it "with --without one group" 


    it "with --without two groups" 


    it "with --without more groups" 

  end
end

