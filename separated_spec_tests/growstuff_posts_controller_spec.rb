require 'rails_helper'

describe PostsController do
  login_member

  def valid_attributes
    member = FactoryBot.create(:member)
    { author_id: member.id, subject: "blah", body: "blah blah" }
  end

  describe "GET RSS feed" do
    it "returns an RSS feed" 

  end

  describe "GET RSS feed for individual post" do
    it "returns an RSS feed" 

  end
end

