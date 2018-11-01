require 'rails_helper'

describe "forums/index" do
  before(:each) do
    @admin = FactoryBot.create(:admin_member)
    controller.stub(:current_user) { @admin }
    @forum1 = FactoryBot.create(:forum)
    @forum2 = FactoryBot.create(:forum)
    assign(:forums, [@forum1, @forum2])
  end

  it "renders a list of forums" 


  it "doesn't display posts for empty forums" 


  context "posts" do
    before(:each) do
      @post = FactoryBot.create(:forum_post, forum: @forum1)
      @comment = FactoryBot.create(:comment, post: @post)
      render
    end

    it "displays posts" 


    it "displays comment count" 

  end
end

