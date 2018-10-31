# frozen_string_literal: true

RSpec.describe Bundler::Source::Git::GitProxy do
  let(:path) { Pathname("path") }
  let(:uri) { "https://github.com/bundler/bundler.git" }
  let(:ref) { "HEAD" }
  let(:revision) { nil }
  let(:git_source) { nil }
  subject { described_class.new(path, uri, ref, revision, git_source) }

  context "with configured credentials" do
    it "adds username and password to URI" 


    it "adds username and password to URI for host" 


    it "does not add username and password to mismatched URI" 


    it "keeps original userinfo" 

  end

  describe "#version" do
    context "with a normal version number" do
      before do
        expect(subject).to receive(:git).with("--version").
          and_return("git version 1.2.3")
      end

      it "returns the git version number" 


      it "does not raise an error when passed into Gem::Version.create" 

    end

    context "with a OSX version number" do
      before do
        expect(subject).to receive(:git).with("--version").
          and_return("git version 1.2.3 (Apple Git-BS)")
      end

      it "strips out OSX specific additions in the version string" 


      it "does not raise an error when passed into Gem::Version.create" 

    end

    context "with a msysgit version number" do
      before do
        expect(subject).to receive(:git).with("--version").
          and_return("git version 1.2.3.msysgit.0")
      end

      it "strips out msysgit specific additions in the version string" 


      it "does not raise an error when passed into Gem::Version.create" 

    end
  end

  describe "#full_version" do
    context "with a normal version number" do
      before do
        expect(subject).to receive(:git).with("--version").
          and_return("git version 1.2.3")
      end

      it "returns the git version number" 

    end

    context "with a OSX version number" do
      before do
        expect(subject).to receive(:git).with("--version").
          and_return("git version 1.2.3 (Apple Git-BS)")
      end

      it "does not strip out OSX specific additions in the version string" 

    end

    context "with a msysgit version number" do
      before do
        expect(subject).to receive(:git).with("--version").
          and_return("git version 1.2.3.msysgit.0")
      end

      it "does not strip out msysgit specific additions in the version string" 

    end
  end

  describe "#copy_to" do
    let(:destination) { tmpdir("copy_to_path") }
    let(:submodules) { false }

    context "when given a SHA as a revision" do
      let(:revision) { "abcd" * 10 }

      it "fails gracefully when resetting to the revision fails" 

    end
  end
end

