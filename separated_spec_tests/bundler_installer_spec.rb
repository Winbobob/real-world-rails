# frozen_string_literal: true

RSpec.describe Bundler::Plugin::Installer do
  subject(:installer) { Bundler::Plugin::Installer.new }

  before do
    # allow(Bundler::SharedHelpers).to receive(:find_gemfile).and_return(Pathname.new("/Gemfile"))
  end

  describe "cli install" do
    it "uses Gem.sources when non of the source is provided" 


    describe "with mocked installers" do
      let(:spec) { double(:spec) }
      it "returns the installed spec after installing git plugins" 


      it "returns the installed spec after installing rubygems plugins" 

    end

    describe "with actual installers" do
      before do
        build_repo2 do
          build_plugin "re-plugin"
          build_plugin "ma-plugin"
        end
      end

      context "git plugins" do
        before do
          build_git "ga-plugin", :path => lib_path("ga-plugin") do |s|
            s.write "plugins.rb"
          end
        end

        let(:result) do
          installer.install(["ga-plugin"], :git => "file://#{lib_path("ga-plugin")}")
        end

        it "returns the installed spec after installing" 


        it "has expected full gem path" 

      end

      context "rubygems plugins" do
        let(:result) do
          installer.install(["re-plugin"], :source => "file://#{gem_repo2}")
        end

        it "returns the installed spec after installing " 


        it "has expected full_gem)path" 

      end

      context "multiple plugins" do
        let(:result) do
          installer.install(["re-plugin", "ma-plugin"], :source => "file://#{gem_repo2}")
        end

        it "returns the installed spec after installing " 


        it "has expected full_gem)path" 

      end
    end
  end
end

