# frozen_string_literal: true

require "rails_helper"

describe ApplicationHelper, type: :helper do
  describe "markdown" do
    context "bad html" do
      it "filter script" 


      it "filter style" 

    end
  end

  it "formats the flash messages" 


  describe "admin?" do
    let(:user) { create :user }
    let(:admin) { create :admin }

    it "knows you are not an admin" 


    it "knows who is the boss" 


    it "use current_user if user not given" 


    it "use current_user if user not given a user" 


    it "know you are not an admin if current_user not present and user param is not given" 

  end

  describe "wiki_editor?" do
    let(:non_editor) { create :non_wiki_editor }
    let(:editor) { create :wiki_editor }

    it "knows non editor is not wiki editor" 


    it "knows wiki editor is wiki editor" 


    it "use current_user if user not given" 


    it "know you are not an wiki editor if current_user not present and user param is not given" 

  end

  describe "owner?" do
    require "ostruct"
    let(:user) { create :user }
    let(:user2) { create :user }
    let(:item) { OpenStruct.new user_id: user.id }

    it "knows who is owner" 

  end

  describe "timeago" do
    it "should work" 

  end

  describe "insert_code_menu_items_tag" do
    it "should work" 

  end

  describe "render_list" do
    it "should work" 


    describe "render_list_items" do
      it "should work" 

    end
  end
end

