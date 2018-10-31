require "spec_helper"

describe JsonSpec::Matchers do
  let(:environment) do
    klass = Class.new
    klass.send(:include, JsonSpec::Matchers)
    klass.new
  end

  let(:json){ %({"json":"spec"}) }

  context "be_json_eql" do
    it "instantiates its matcher" 


    it "returns its matcher" 

  end

  context "include_json" do
    it "instantiates its matcher" 


    it "returns its matcher" 

  end

  context "have_json_path" do
    let(:path){ "json" }

    it "instantiates its matcher" 


    it "returns its matcher" 

  end

  context "have_json_type" do
    let(:type){ Hash }

    it "instantiates its matcher" 


    it "returns its matcher" 

  end

  context "have_json_size" do
    let(:size){ 1 }

    it "instantiates its matcher" 


    it "returns its matcher" 

  end
end

