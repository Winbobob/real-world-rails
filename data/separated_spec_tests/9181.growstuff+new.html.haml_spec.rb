require 'rails_helper'

describe "posts/new" do
  before(:each) do
    @author = FactoryBot.create(:member)
    assign(:post, FactoryBot.create(:post, author: @author))
    # assign(:forum, Forum.new)
    sign_in @author
    controller.stub(:current_user) { @author }
  end

  it "renders new post form" 


  it 'no hidden forum field' 


  it 'no forum mentioned' 


  it "asks what's going on in your garden" 


  context "forum specified" do
    before(:each) do
      @forum = assign(:forum, FactoryBot.create(:forum))
      assign(:post, FactoryBot.create(:post, forum: @forum))
      render
    end

    it 'creates a hidden field' 


    it 'tells the user what forum it will be posted in' 


    it "asks what's going on generally" 

  end

  it 'shows markdown help' 

end

