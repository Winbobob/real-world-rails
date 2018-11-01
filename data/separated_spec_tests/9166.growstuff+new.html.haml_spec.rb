require 'rails_helper'

describe "comments/new" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @post = FactoryBot.create(:post)
    @comment = FactoryBot.create(:comment, post: @post)
    assign(:comment, @comment)
    assign(:comments, [@comment])
    render
  end

  it "shows the text of the post under discussion" 


  it "shows previous comments" 


  it "shows the correct comment count" 


  it "renders new comment form" 


  it 'shows markdown help' 

end

