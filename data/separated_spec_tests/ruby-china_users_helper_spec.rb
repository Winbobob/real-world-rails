# frozen_string_literal: true

require "rails_helper"

describe UsersHelper, type: :helper do
  describe "user_avatar_width_for_size" do
    it "should calculate avatar width correctly" 

  end

  describe "user_name_tag" do
    it "should result right html in normal" 


    it "should result right html with string param and downcase url" 


    it "should out name with Team" 


    it "should result empty with nil param" 

  end

  describe "user_avatar_tag" do
    it "should work if user not exist" 


    it "should work if user exists" 


    it "should work if avatar exist" 


    it "should work with different size" 


    it "should work with timestamp param" 


    it "should work if link is false" 

  end

  describe ".render_user_level_tag" do
    let(:user) { create(:user) }
    subject { helper.render_user_level_tag(user) }

    it "admin should work" 


    it "vip should work" 


    it "blocked should work" 


    it "newbie should work" 


    it "normal should work" 

  end

  describe ".reward_user_tag" do
    it "should work" 


    it "should workd" 

  end
end

