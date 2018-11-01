require 'rails_helper'

describe "roles/show" do
  before(:each) do
    @role = assign(:role, stub_model(Role,
      name: "Name",
      description: "MyText"))
  end

  it "renders attributes in <p>" 

end

