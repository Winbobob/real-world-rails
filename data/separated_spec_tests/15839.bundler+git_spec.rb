# frozen_string_literal: true

RSpec.describe Bundler::Source::Git do
  before do
    allow(Bundler).to receive(:root) { Pathname.new("root") }
  end

  let(:uri) { "https://github.com/foo/bar.git" }
  let(:options) do
    { "uri" => uri }
  end

  subject { described_class.new(options) }

  describe "#to_s" do
    it "returns a description" 


    context "when the URI contains credentials" do
      let(:uri) { "https://my-secret-token:x-oauth-basic@github.com/foo/bar.git" }

      it "filters credentials" 

    end
  end
end

