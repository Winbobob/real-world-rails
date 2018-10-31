require "spec_helper"

describe "finding factories keyed by class instead of symbol" do
  before do
    define_model("User") do
      attr_accessor :name, :email
    end

    FactoryBot.define do
      factory :user do
        name "John Doe"
        sequence(:email) { |n| "person#{n}@example.com" }
      end
    end
  end

  context "when deprecated class lookup if allowed", :silence_deprecation do
    it "allows interaction based on class name" 

  end

  context "when class lookup is disallowed" do
    it "doesn't find the factory" 

  end
end

