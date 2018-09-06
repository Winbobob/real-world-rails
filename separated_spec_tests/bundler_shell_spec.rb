# frozen_string_literal: true

RSpec.describe Bundler::UI::Shell do
  subject { described_class.new }

  before { subject.level = "debug" }

  describe "#info" do
    before { subject.level = "info" }
    it "prints to stdout" 

  end

  describe "#confirm" do
    before { subject.level = "confirm" }
    it "prints to stdout" 

  end

  describe "#warn" do
    before { subject.level = "warn" }
    it "prints to stdout", :bundler => "< 2" 


    it "prints to stderr", :bundler => "2" 


    context "when stderr flag is enabled" do
      before { Bundler.settings.temporary(:error_on_stderr => true) }
      it "prints to stderr" 

    end
  end

  describe "#debug" do
    it "prints to stdout" 

  end

  describe "#error" do
    before { subject.level = "error" }

    it "prints to stdout", :bundler => "< 2" 


    it "prints to stderr", :bundler => "2" 


    context "when stderr flag is enabled" do
      before { Bundler.settings.temporary(:error_on_stderr => true) }
      it "prints to stderr" 


      context "when stderr is closed" do
        it "doesn't report anything" 

      end
    end
  end
end

