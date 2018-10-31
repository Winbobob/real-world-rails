require 'rails_helper'

describe Utils do
  describe "#unindent" do
    it "unindents to the level of the greatest consistant indention" 

  end

  describe "#interpolate_jsonpaths" do
    let(:payload) { { :there => { :world => "WORLD" }, :works => "should work" } }

    it "interpolates jsonpath expressions between matching <>'s" 


    it "optionally supports treating values that start with '$' as raw JSONPath" 

  end

  describe "#recursively_interpolate_jsonpaths" do
    it "interpolates all string values in a structure" 

  end

  describe "#value_at" do
    it "returns the value at a JSON path" 


    it "returns nil when the path cannot be followed" 

  end

  describe "#values_at" do
    it "returns arrays of matching values" 


    it "should allow escaping" 

  end

  describe "#jsonify" do
    it "escapes </script> tags in the output JSON" 


    it "html_safes the output unless :skip_safe is passed in" 

  end

  describe "#pretty_jsonify" do
    it "escapes </script> tags in the output JSON" 

  end

  describe "#sort_tuples!" do
    let(:tuples) {
      time = Time.now
      [
        [2, "a", time - 1],  # 0
        [2, "b", time - 1],  # 1
        [1, "b", time - 1],  # 2
        [1, "b", time],      # 3
        [1, "a", time],      # 4
        [2, "a", time + 1],  # 5
        [2, "a", time],      # 6
      ]
    }

    it "sorts tuples like arrays by default" 


    it "sorts tuples in order specified: case 1" 


    it "sorts tuples in order specified: case 2" 


    it "always succeeds in sorting even if it finds pairs of incomparable objects" 

  end

  context "#parse_duration" do
    it "works with correct arguments" 


    it "returns nil when passed nil" 


    it "warns and returns nil when not parseable" 

  end

  context "#if_present" do
    it "returns nil when passed nil" 


    it "calls the specified method when the argument is present" 

  end
end

