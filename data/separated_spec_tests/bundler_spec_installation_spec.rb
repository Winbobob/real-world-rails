# frozen_string_literal: true

require "bundler/installer/parallel_installer"

RSpec.describe Bundler::ParallelInstaller::SpecInstallation do
  let!(:dep) do
    a_spec = Object.new
    def a_spec.name
      "I like tests"
    end
    a_spec
  end

  describe "#ready_to_enqueue?" do
    context "when in enqueued state" do
      it "is falsey" 

    end

    context "when in installed state" do
      it "returns falsey" 

    end

    it "returns truthy" 

  end

  describe "#dependencies_installed?" do
    context "when all dependencies are installed" do
      it "returns true" 

    end

    context "when all dependencies are not installed" do
      it "returns false" 

    end
  end
end

