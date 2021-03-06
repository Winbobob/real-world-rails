# frozen_string_literal: true

RSpec.describe Bundler::Index do
  let(:specs) { [] }
  subject { described_class.build {|i| i.use(specs) } }

  context "specs with a nil platform" do
    let(:spec) do
      Gem::Specification.new do |s|
        s.name = "json"
        s.version = "1.8.3"
        allow(s).to receive(:platform).and_return(nil)
      end
    end
    let(:specs) { [spec] }

    describe "#search_by_spec" do
      it "finds the spec when a nil platform is specified" 


      it "finds the spec when a ruby platform is specified" 

    end
  end

  context "with specs that include development dependencies" do
    let(:specs) { [*build_spec("a", "1.0.0") {|s| s.development("b", "~> 1.0") }] }

    it "does not include b in #dependency_names" 

  end
end

