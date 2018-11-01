require 'rails_helper'

describe "posts/index" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @author = FactoryBot.create(:member)
    page = 1
    per_page = 2
    total_entries = 2
    posts = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
      pager.replace([
                      FactoryBot.create(:post, author: @author),
                      FactoryBot.create(:post, author: @author)
                    ])
    end
    assign(:posts, posts)
    render
  end

  it "renders a list of posts" 


  it "contains two gravatar icons" 


  it "contains RSS feed links for posts and comments" 

end
