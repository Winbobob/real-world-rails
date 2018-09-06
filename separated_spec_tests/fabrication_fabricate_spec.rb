require 'spec_helper'

describe Fabricate do
  describe ".times" do
    it "fabricates an object X times" 


    it "delegates overrides and blocks properly" 

  end

  describe ".build_times" do
    it "fabricates an object X times" 


    it "delegates overrides and blocks properly" 

  end

  describe ".attributes_for_times" do
    it "fabricates an object X times" 


    it "delegates overrides and blocks properly" 

  end

  describe ".to_params", depends_on: :active_record do
    subject { Fabricate.to_params(:parent_active_record_model_with_children) }

    it do
      should == {
        'dynamic_field' => nil,
        'nil_field' => nil,
        'number_field' => 5,
        'string_field' => 'content',
        'false_field' => false,
        'extra_fields' => {},
        'child_active_record_models' => [
          { 'number_field' => 10 }, { 'number_field' => 10 }
        ]
      }
    end

    it 'is accessible as symbols' 

  end
end

