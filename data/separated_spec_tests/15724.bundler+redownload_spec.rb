# frozen_string_literal: true

RSpec.describe "bundle install" do
  before :each do
    gemfile <<-G
      source "file://#{gem_repo1}"
      gem "rack"
    G
  end

  shared_examples_for "an option to force redownloading gems" do
    it "re-installs installed gems" 


    it "works on first bundle install" 


    context "with a git gem" do
      let!(:ref) { build_git("foo", "1.0").ref_for("HEAD", 11) }

      before do
        gemfile <<-G
          gem "foo", :git => "#{lib_path("foo-1.0")}"
        G
      end

      it "re-installs installed gems" 


      it "works on first bundle install" 

    end
  end

  describe "with --force" do
    it_behaves_like "an option to force redownloading gems" do
      let(:flag) { "force" }
    end

    it "shows a deprecation when single flag passed", :bundler => 2 do
      bundle! "install --force"
      expect(out).to include "[DEPRECATED FOR 2.0] The `--force` option has been renamed to `--redownload`"
    end

    it "shows a deprecation when multiple flags passed", :bundler => 2 do
      bundle! "install --no-color --force"
      expect(out).to include "[DEPRECATED FOR 2.0] The `--force` option has been renamed to `--redownload`"
    end

    it "does not show a deprecation when single flag passed", :bundler => "< 2" 


    it "does not show a deprecation when multiple flags passed", :bundler => "< 2" 

  end

  describe "with --redownload" do
    it_behaves_like "an option to force redownloading gems" do
      let(:flag) { "redownload" }
    end

    it "does not show a deprecation when single flag passed" 


    it "does not show a deprecation when single multiple flags passed" 

  end
end

