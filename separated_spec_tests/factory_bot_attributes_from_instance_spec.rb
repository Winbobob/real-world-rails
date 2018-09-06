require "spec_helper"

describe "calling methods on the model instance" do
  before do
    define_model('User', age: :integer, age_copy: :integer) do
      def age
        read_attribute(:age) || 18
      end
    end

    FactoryBot.define do
      factory :user do
        age_copy { age }
      end
    end
  end

  context "without the attribute being overridden" do
    it "returns the correct value from the instance" 


    it "returns nil during attributes_for" 


    it "doesn't instantiate a record with attributes_for" 

  end

  context "with the attribute being overridden" do
    it "uses the overridden value" 


    it "uses the overridden value during attributes_for" 

  end

  context "with the referenced attribute being overridden" do
    it "uses the overridden value" 


    it "uses the overridden value during attributes_for" 

  end
end

