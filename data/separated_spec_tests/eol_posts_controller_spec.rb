require File.dirname(__FILE__) + '/../../spec_helper'

describe Forums::PostsController do

  before(:all) do
    load_foundation_cache
  end

  describe 'GET show' do
    it "should increment its topics view count" 

  end

  describe 'POST create' do
    it "must be logged in to create" 


    it "logged in users can create" 

  end

  describe 'DELETE destroy' do
    it 'should redirect non-logged in users to login before deleting' 


    it 'should not allow unauthorized users to delete' 


    it 'should allow owners to delete posts' 


    it 'should allow admins to delete posts' 

  end
end

