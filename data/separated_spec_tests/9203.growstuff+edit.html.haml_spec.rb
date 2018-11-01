require 'rails_helper'

describe "roles/edit" do
  before(:each) do
    @role = assign(:role, stub_model(Role,
      name: "MyString",
      description: "MyText"))
  end

  it "renders the edit role form" 

end

