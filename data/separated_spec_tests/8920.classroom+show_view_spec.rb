# frozen_string_literal: true

require "rails_helper"

RSpec.describe Video::ShowView do
  subject do
    Video::ShowView.new(
      id: "12345",
      title: "Title",
      provider: "youtube",
      description: "description"
    )
  end

  describe "attributes" do
    it "responds to id" 


    it "responds to title" 


    it "responds to provider" 


    it "responds to description" 

  end

  describe "#url" do
    it "returns correct url" 

  end
end

