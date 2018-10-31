# encoding: utf-8
# frozen_string_literal: true

require "bundler"
require "tmpdir"

RSpec.describe Bundler do
  describe "#load_gemspec_uncached" do
    let(:app_gemspec_path) { tmp("test.gemspec") }
    subject { Bundler.load_gemspec_uncached(app_gemspec_path) }

    context "with incorrect YAML file" do
      before do
        File.open(app_gemspec_path, "wb") do |f|
          f.write strip_whitespace(<<-GEMSPEC)
            ---
              {:!00 ao=gu\g1= 7~f
          GEMSPEC
        end
      end

      it "catches YAML syntax errors" 


      context "on Rubies with a settable YAML engine", :if => defined?(YAML::ENGINE) do
        context "with Syck as YAML::Engine" do
          it "raises a GemspecError after YAML load throws ArgumentError" 

        end

        context "with Psych as YAML::Engine" do
          it "raises a GemspecError after YAML load throws Psych::SyntaxError" 

        end
      end
    end

    context "with correct YAML file", :if => defined?(Encoding) do
      it "can load a gemspec with unicode characters with default ruby encoding" 

    end

    it "sets loaded_from" 


    context "validate is true" do
      subject { Bundler.load_gemspec_uncached(app_gemspec_path, true) }

      it "validates the specification" 

    end

    context "with gemspec containing local variables" do
      before do
        File.open(app_gemspec_path, "wb") do |f|
          f.write strip_whitespace(<<-GEMSPEC)
            must_not_leak = true
            Gem::Specification.new do |gem|
              gem.name = "leak check"
            end
          GEMSPEC
        end
      end

      it "should not pollute the TOPLEVEL_BINDING" 

    end
  end

  describe "#which" do
    let(:executable) { "executable" }
    let(:path) { %w[/a /b c ../d /e] }
    let(:expected) { "executable" }

    before do
      ENV["PATH"] = path.join(File::PATH_SEPARATOR)

      allow(File).to receive(:file?).and_return(false)
      allow(File).to receive(:executable?).and_return(false)
      if expected
        expect(File).to receive(:file?).with(expected).and_return(true)
        expect(File).to receive(:executable?).with(expected).and_return(true)
      end
    end

    subject { described_class.which(executable) }

    shared_examples_for "it returns the correct executable" do
      it "returns the expected file" 

    end

    it_behaves_like "it returns the correct executable"

    context "when the executable in inside a quoted path" do
      let(:expected) { "/e/executable" }
      it_behaves_like "it returns the correct executable"
    end

    context "when the executable is not found" do
      let(:expected) { nil }
      it_behaves_like "it returns the correct executable"
    end
  end

  describe "configuration" do
    context "disable_shared_gems" do
      it "should unset GEM_PATH with empty string" 

    end
  end

  describe "#rm_rf" do
    context "the directory is world writable" do
      let(:bundler_ui) { Bundler.ui }
      it "should raise a friendly error" 

    end
  end

  describe "#user_home" do
    context "home directory is set" do
      it "should return the user home" 

    end

    context "home directory is not set" do
      it "should issue warning and return a temporary user home" 

    end
  end

  describe "#tmp_home_path" do
    it "should create temporary user home" 

  end

  describe "#requires_sudo?" do
    let!(:tmpdir) { Dir.mktmpdir }
    let(:bundle_path) { Pathname("#{tmpdir}/bundle") }

    def clear_cached_requires_sudo
      # Private in ruby 1.8.7
      return unless Bundler.instance_variable_defined?(:@requires_sudo_ran)
      Bundler.send(:remove_instance_variable, :@requires_sudo_ran)
      Bundler.send(:remove_instance_variable, :@requires_sudo)
    end

    before do
      clear_cached_requires_sudo
      allow(Bundler).to receive(:which).with("sudo").and_return("/usr/bin/sudo")
      allow(Bundler).to receive(:bundle_path).and_return(bundle_path)
    end

    after do
      FileUtils.rm_rf(tmpdir)
      clear_cached_requires_sudo
    end

    subject { Bundler.requires_sudo? }

    context "bundle_path doesn't exist" do
      it { should be false }

      context "and parent dir can't be written" do
        before do
          FileUtils.chmod(0o500, tmpdir)
        end

        it { should be true }
      end

      context "with unwritable files in a parent dir" do
        # Regression test for https://github.com/bundler/bundler/pull/6316
        # It doesn't matter if there are other unwritable files so long as
        # bundle_path can be created
        before do
          file = File.join(tmpdir, "unrelated_file")
          FileUtils.touch(file)
          FileUtils.chmod(0o400, file)
        end

        it { should be false }
      end
    end

    context "bundle_path exists" do
      before do
        FileUtils.mkdir_p(bundle_path)
      end

      it { should be false }

      context "and is unwritable" do
        before do
          FileUtils.chmod(0o500, bundle_path)
        end

        it { should be true }
      end
    end
  end

  context "user cache dir" do
    let(:home_path)                  { Pathname.new(ENV["HOME"]) }

    let(:xdg_data_home)              { home_path.join(".local") }
    let(:xdg_cache_home)             { home_path.join(".cache") }
    let(:xdg_config_home)            { home_path.join(".config") }

    let(:bundle_user_home_default)   { home_path.join(".bundle") }
    let(:bundle_user_home_custom)    { xdg_data_home.join("bundle") }

    let(:bundle_user_cache_default)  { bundle_user_home_default.join("cache") }
    let(:bundle_user_cache_custom)   { xdg_cache_home.join("bundle") }

    let(:bundle_user_config_default) { bundle_user_home_default.join("config") }
    let(:bundle_user_config_custom)  { xdg_config_home.join("bundle") }

    let(:bundle_user_plugin_default) { bundle_user_home_default.join("plugin") }
    let(:bundle_user_plugin_custom)  { xdg_data_home.join("bundle").join("plugin") }

    describe "#user_bundle_path" do
      before do
        allow(Bundler.rubygems).to receive(:user_home).and_return(home_path)
      end

      it "should use the default home path" 


      it "should use custom home path as root for other paths" 


      it "should use all custom paths, except home" 

    end
  end
end

