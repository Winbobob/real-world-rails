require 'rails_helper'

describe "forums/show" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @forum = assign(:forum, FactoryBot.create(:forum))
  end

  it "renders attributes" 


  it "parses markdown description into html" 


  it 'links to new post with the forum id' 


  it 'has no posts' 


  it 'shows posts' 

end

