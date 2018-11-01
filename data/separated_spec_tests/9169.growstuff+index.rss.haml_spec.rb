require 'rails_helper'

describe 'comments/index.rss.haml' do
  before(:each) do
    controller.stub(:current_user) { nil }
    @author = FactoryBot.create(:member)
    @post = FactoryBot.create(:post)
    assign(:comments, [
             FactoryBot.create(:comment, author: @author, post: @post),
             FactoryBot.create(:comment, author: @author, post: @post)
           ])
    render
  end

  it 'shows RSS feed title' 


  it 'shows item title' 


  it 'escapes html for link to post' 


  it 'shows content of comments' 

end

