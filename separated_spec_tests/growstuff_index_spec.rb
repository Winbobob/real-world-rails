require 'rails_helper'

describe 'admin/index.html.haml', type: "view" do
  before(:each) do
    @member = FactoryBot.create(:admin_member)
    sign_in @member
    controller.stub(:current_user) { @member }
    render
  end

  it "includes links to manage various things" 


  it "has a link to newsletter subscribers" 

end

