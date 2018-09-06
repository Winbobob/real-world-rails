require 'spec_helper'

describe FoldersController do
  render_views

  before do
    make_a_typical_project
  end

  describe "#create" do
    it "should allow participants to create folders" 


    it "should not allow observers to create folders" 


  end

  describe "#destroy" do

    before do 
      @folder = Factory(:folder, :project_id => @project.id, :user_id => @user.id)
    end

    it "should allow participants to delete folders" 


    it "should not allow observers to delete folders" 


  end

  describe "#rename" do

    before do
      @folder = Factory(:folder, :project_id => @project.id, :user_id => @user.id, :name => 'Keep this name')
    end

    it "should allow participants to rename folders" 


    it "should not allow observers to create folders" 


  end

end

