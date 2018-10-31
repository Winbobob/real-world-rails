# frozen_string_literal: true

require 'spec_helper'
require 'spree/core/class_constantizer'

module ClassConstantizerTest
  ClassA = Class.new
  ClassB = Class.new

  def self.reload
    [:ClassA, :ClassB].each do |klass|
      remove_const(klass)
      const_set(klass, Class.new)
    end
  end
end

RSpec.describe Spree::Core::ClassConstantizer::Set do
  let(:set) { described_class.new }

  describe "#concat" do
    it "can add one item" 


    it "can add two items" 

  end

  describe "<<" do
    it "can add by string" 


    it "can add by class" 


    describe "class redefinition" do
      shared_examples "working code reloading" do
        it "works with a class" 

      end

      context "with a class" do
        before { set << ClassConstantizerTest::ClassA }
        it_should_behave_like "working code reloading"
      end

      context "with a string" do
        before { set << "ClassConstantizerTest::ClassA" }
        it_should_behave_like "working code reloading"
      end
    end
  end
end

