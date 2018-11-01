require 'rails_helper'

describe "roles/index" do
  before(:each) do
    controller.stub(:current_user) { nil }
    assign(:roles, [
             stub_model(Role,
               name: "Name",
               description: "MyText"),
             stub_model(Role,
               name: "Name",
               description: "MyText")
           ])
  end

  it "renders a list of roles" 

end

