require 'rails_helper'

RSpec.describe Admin::BackupsController do
  let(:admin) { Fabricate(:admin) }

  before do
    sign_in(admin)
  end

  describe "parameters" do
    it "returns 404 without a valid filter" 


    it "returns 404 without a valid id" 

  end

  describe "for a post" do
    it "returns an empty array when the post doesn't exist" 


    it "returns a history when the post exists" 


  end

  describe "for a topic" do
    it "returns empty history when the topic doesn't exist" 


    it "returns a history when the topic exists" 

  end
end

