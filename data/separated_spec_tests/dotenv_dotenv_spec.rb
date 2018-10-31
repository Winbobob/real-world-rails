require "spec_helper"

describe Dotenv do
  before do
    Dir.chdir(File.expand_path("../fixtures", __FILE__))
  end

  shared_examples "load" do
    context "with no args" do
      let(:env_files) { [] }

      it "defaults to .env" 

    end

    context "with a tilde path" do
      let(:env_files) { ["~/.env"] }

      it "expands the path" 

    end

    context "with multiple files" do
      let(:env_files) { [".env", fixture_path("plain.env")] }

      let(:expected) do
        { "OPTION_A" => "1",
          "OPTION_B" => "2",
          "OPTION_C" => "3",
          "OPTION_D" => "4",
          "OPTION_E" => "5",
          "PLAIN" => "true",
          "DOTENV" => "true" }
      end

      it "loads all files" 


      it "returns hash of loaded environments" 

    end
  end

  describe "load" do
    let(:env_files) { [] }
    subject { Dotenv.load(*env_files) }

    it_behaves_like "load"

    it "initializes the Environment with a truthy is_load" 


    context "when the file does not exist" do
      let(:env_files) { [".env_does_not_exist"] }

      it "fails silently" 

    end
  end

  describe "load!" do
    let(:env_files) { [] }
    subject { Dotenv.load!(*env_files) }

    it_behaves_like "load"

    it "initializes Environment with truthy is_load" 


    context "when one file exists and one does not" do
      let(:env_files) { [".env", ".env_does_not_exist"] }

      it "raises an Errno::ENOENT error" 

    end
  end

  describe "overload" do
    let(:env_files) { [fixture_path("plain.env")] }
    subject { Dotenv.overload(*env_files) }
    it_behaves_like "load"

    it "initializes the Environment with a falsey is_load" 


    context "when loading a file containing already set variables" do
      let(:env_files) { [fixture_path("plain.env")] }

      it "overrides any existing ENV variables" 

    end

    context "when the file does not exist" do
      let(:env_files) { [".env_does_not_exist"] }

      it "fails silently" 

    end
  end

  describe "with an instrumenter" do
    let(:instrumenter) { double("instrumenter", instrument: {}) }
    before { Dotenv.instrumenter = instrumenter }
    after { Dotenv.instrumenter = nil }

    describe "load" do
      it "instruments if the file exists" 


      it "does not instrument if file does not exist" 

    end
  end

  describe "Unicode" do
    subject { fixture_path("bom.env") }

    it "loads a file with a Unicode BOM" 


    it "fixture file has UTF-8 BOM" 

  end

  def expand(path)
    File.expand_path path
  end
end

