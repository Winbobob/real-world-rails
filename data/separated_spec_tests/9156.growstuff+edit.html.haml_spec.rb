require 'rails_helper'

describe "forums/edit" do
  before(:each) do
    @forum = assign(:forum, stub_model(Forum,
      name: "MyString",
      description: "MyText",
      owner_id: 1))
  end

  it "renders the edit forum form" 

end

