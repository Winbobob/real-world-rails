# frozen_string_literal: true

require "bundler/definition"

RSpec.describe Bundler::Definition do
  describe "#lock" do
    before do
      allow(Bundler).to receive(:settings) { Bundler::Settings.new(".") }
      allow(Bundler::SharedHelpers).to receive(:find_gemfile) { Pathname.new("Gemfile") }
      allow(Bundler).to receive(:ui) { double("UI", :info => "", :debug => "") }
    end
    context "when it's not possible to write to the file" do
      subject { Bundler::Definition.new(nil, [], Bundler::SourceList.new, []) }

      it "raises an PermissionError with explanation" 

    end
    context "when a temporary resource access issue occurs" do
      subject { Bundler::Definition.new(nil, [], Bundler::SourceList.new, []) }

      it "raises a TemporaryResourceError with explanation" 

    end
  end

  describe "detects changes" do
    it "for a path gem with changes", :bundler => "< 2" 


    it "for a path gem with changes", :bundler => "2" 


    it "for a path gem with deps and no changes", :bundler => "< 2" 


    it "for a path gem with deps and no changes", :bundler => "2" 


    it "for a rubygems gem" 

  end

  describe "initialize" do
    context "gem version promoter" do
      context "with lockfile" do
        before do
          install_gemfile <<-G
          source "file://#{gem_repo1}"
          gem "foo"
          G
        end

        it "should get a locked specs list when updating all" 

      end

      context "without gemfile or lockfile" do
        it "should not attempt to parse empty lockfile contents" 

      end

      context "eager unlock" do
        let(:source_list) do
          Bundler::SourceList.new.tap do |source_list|
            source_list.global_rubygems_source = "file://#{gem_repo4}"
          end
        end

        before do
          gemfile <<-G
            source "file://#{gem_repo4}"
            gem 'isolated_owner'

            gem 'shared_owner_a'
            gem 'shared_owner_b'
          G

          lockfile <<-L
            GEM
              remote: file://#{gem_repo4}
              specs:
                isolated_dep (2.0.1)
                isolated_owner (1.0.1)
                  isolated_dep (~> 2.0)
                shared_dep (5.0.1)
                shared_owner_a (3.0.1)
                  shared_dep (~> 5.0)
                shared_owner_b (4.0.1)
                  shared_dep (~> 5.0)

            PLATFORMS
              ruby

            DEPENDENCIES
              shared_owner_a
              shared_owner_b
              isolated_owner

            BUNDLED WITH
               1.13.0
          L
        end

        it "should not eagerly unlock shared dependency with bundle install conservative updating behavior" 


        it "should not eagerly unlock shared dependency with bundle update conservative updating behavior" 

      end
    end
  end

  describe "find_resolved_spec" do
    it "with no platform set in SpecSet" 

  end

  describe "find_indexed_specs" do
    it "with no platform set in indexed specs" 

  end

  def build_stub_spec(name, version)
    Bundler::StubSpecification.new(name, version, nil, nil)
  end

  def mock_source_list
    Class.new do
      def all_sources
        []
      end

      def path_sources
        []
      end

      def rubygems_remotes
        []
      end

      def replace_sources!(arg)
        nil
      end
    end.new
  end
end

