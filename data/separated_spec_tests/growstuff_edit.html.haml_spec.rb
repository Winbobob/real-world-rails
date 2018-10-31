require 'rails_helper'

describe "posts/edit" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @author = FactoryBot.create(:member)
    @post = assign(:post, FactoryBot.create(:post, author: @author))
  end

  context "logged in" do
    before(:each) do
      sign_in @author
      render
    end

    it "renders the edit post form" 


    it 'no hidden forum field' 


    it 'no forum mentioned' 


    context "forum specified" do
      before(:each) do
        @forum = assign(:forum, FactoryBot.create(:forum))
        assign(:post, FactoryBot.create(:post,
          forum: @forum,
          author: @author))
        render
      end

      it 'creates a hidden field' 


      it 'tells the user what forum it will be posted in' 

    end
  end
end

