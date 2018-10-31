require 'spec_helper'

describe "Storytime::Sqlite3SearchAdapter" do
  before(:each) do
    @blog_posts = FactoryGirl.create_list(:post, 3)
    @pages = FactoryGirl.create_list(:page, 3)

    Storytime.search_adapter = Storytime::Sqlite3SearchAdapter
  end

  describe ".search" do
    it "searches all storytime posts for a given search string" 


    it "searches only the given model" 

  end
end

