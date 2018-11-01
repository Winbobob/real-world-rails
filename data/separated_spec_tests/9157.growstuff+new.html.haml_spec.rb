require 'rails_helper'

describe "forums/new" do
  before(:each) do
    @forum = assign(:forum, FactoryBot.create(:forum))
    render
  end

  it "renders new forum form" 

end

