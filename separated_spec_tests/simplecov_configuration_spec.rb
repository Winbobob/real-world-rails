# frozen_string_literal: true

require "helper"

describe SimpleCov::Configuration do
  let(:config_class) do
    Class.new do
      include SimpleCov::Configuration
    end
  end
  let(:config) { config_class.new }

  describe "#tracked_files" do
    context "when configured" do
      let(:glob) { "{app,lib}/**/*.rb" }
      before { config.track_files(glob) }

      it "returns the configured glob" 


      context "and configured again with nil" do
        before { config.track_files(nil) }

        it "returns nil" 

      end
    end

    context "when unconfigured" do
      it "returns nil" 

    end
  end
end

