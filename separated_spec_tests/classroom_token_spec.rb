# frozen_string_literal: true

require "rails_helper"

describe GitHub::Token do
  subject { described_class }

  let(:student) { classroom_student }

  describe "#scopes", :vcr do
    it "returns the scopes of the token in an array" 

  end

  describe "#expand_scopes", :vcr do
    it "converts scopes to their expanded form" 

  end

  describe "descendents" do
    it "returns [] when the scope is the last child" 


    it "returns a list of children when it is a middle child" 


    it "returns a list of children when it is a parent" 


    it "returns [] when the scope is childless" 

  end
end

