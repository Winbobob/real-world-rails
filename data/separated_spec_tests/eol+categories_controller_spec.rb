require File.dirname(__FILE__) + '/../../spec_helper'

describe Forums::CategoriesController do

  before(:all) do
    load_foundation_cache
    @normal_user = User.gen
    @admin = User.gen(:admin => true)
  end

  describe 'POST create' do
    it "must be an admin to create" 


    it "must be an admin to create" 


    it "admins can create" 

  end

  describe 'POST move_up, move_down' do
    before(:all) do
      5.times { ForumCategory.gen }
    end
    before(:each) do
      session[:user_id] = @admin.id
    end

    it "should move categories up" 


    it "should not move first category up" 


    it "should move categories down" 


    it "should not move last category down" 

  end

  describe 'PUT update' do
    before(:each) do
      session[:user_id] = @admin.id
    end
    it "should update categories" 

  end

  describe 'DELETE destroy' do
    it 'must be admin to delete' 


    it 'must be admin to delete' 


    it 'should allow admins to delete posts' 

  end
end

