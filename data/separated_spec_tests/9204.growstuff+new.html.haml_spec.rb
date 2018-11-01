require 'rails_helper'

describe "roles/new" do
  before(:each) do
    assign(:role, stub_model(Role,
      name: "MyString",
      description: "MyText").as_new_record)
  end

  it "renders new role form" 

end

