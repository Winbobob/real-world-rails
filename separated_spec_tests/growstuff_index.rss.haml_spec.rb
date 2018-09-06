require 'rails_helper'

describe 'posts/index.rss.haml', type: "view" do
  before(:each) do
    controller.stub(:current_user) { nil }
    author = FactoryBot.create(:member)
    @post1 = FactoryBot.create(:post, id: 1, author: author)
    @post2 = FactoryBot.create(:post, id: 2, author: author)
    assign(:posts, [@post1, @post2])
    render
  end

  it 'shows RSS feed title' 


  it 'shows content of posts' 


  it 'gives the author in the item title' 

end

