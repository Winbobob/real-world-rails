# frozen_string_literal: true

require "rails_helper"

describe "API V3", "replies", type: :request do
  let!(:reply) { create(:reply, user: current_user) }

  describe "GET /api/v3/replies/:id.json" do
    it "should be ok" 


    it "should return right abilities when owner visit" 


    it "should return right abilities when admin visit" 

  end

  describe "POST /api/v3/replies/:id.json" do
    it "require login" 


    it "require owner" 


    it "should work by owner" 


    it "should work by admin" 

  end

  describe "DELETE /api/v3/replies/:id.json" do
    it "require login" 


    it "require owner" 


    it "should work by owner" 


    it "should work by admin" 

  end
end

