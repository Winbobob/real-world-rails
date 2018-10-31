require 'rails_helper'

describe 'members/show.rss.haml', type: "view" do
  subject { rendered }

  before(:each) do
    @member = assign(:member, FactoryBot.create(:member))
    @post1 = FactoryBot.create(:post, id: 1, author: @member)
    @post2 = FactoryBot.create(:markdown_post, id: 2, author: @member)
    assign(:posts, [@post1, @post2])
    render
  end

  it 'shows RSS feed title' 


  it 'shows content of posts' 


  it 'renders post bodies to HTML and XML-escapes them' 


  it 'gives the author in the item title' 

end

