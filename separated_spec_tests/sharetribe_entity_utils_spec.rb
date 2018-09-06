require 'spec_helper'

describe EntityUtils do
  it "#define_entity" 


  it "#define_builder" 


  it "#define_builder supports nested entities" 


  it "#define_builder handles empty nested entities" 


  it "#define_builder can nest other builders" 


  it "#define_builder supports nested entity collections" 


  it "#define_builder handles empty nested collection" 


  it "#define_builder accepts only symbol keys" 


  it "#define_builder can nest other builders for collections" 


  it "#define_builder returns error field path message for nested entities" 


  it "#define_builder returns error field path for nested entity collection" 


  it "#define_builder returns and error code and a message" 


  it "#define_builder returns result, if result: true and does not raise an error" 


  it "#define_builder :callable validator" 


  it "#define_builder :enumerable validator" 


  it "#define builder :range validator" 


  it "define_builder :str_to_time transformer" 


  it "define_builder :utc_str_to_time transformer" 


  it "#define_builder :set validator" 


  it "#define_builder gt validator" 


  it "#define_builder gte validator" 


  it "#define_builder lt validator" 


  it "#define_builder lte validator" 


  it "#define_builder is fast" 


  describe "#serializes" do
    let(:name_details_entity) {
      EntityUtils.define_builder(
          [:first, :string, :mandatory],
          [:middle, :string, default: "Middle"],
          [:last, :string, :mandatory]
        )
    }

    context "success" do
      it "serializes to JSON" 

    end

    context "failure" do
      it "validates the input and fails for invalid" 

    end

    it "serializing and deserializing gives original value" 

  end

  describe "#deserializes" do
    let(:name_details_entity) {
      EntityUtils.define_builder(
          [:first, :string, :mandatory],
          [:middle, :string, default: "Middle"],
          [:last, :string, :mandatory]
        )
    }

    context "success" do
      it "deserializes from JSON" 

    end

    context "failure" do
      it "validates the input and fails for invalid" 

    end
  end
end

