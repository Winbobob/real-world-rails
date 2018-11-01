require 'rails_helper'

describe "gardens/new" do
  before(:each) do
    @member = FactoryBot.create(:member)
    sign_in @member
    controller.stub(:current_user) { @member }
    @garden = FactoryBot.create(:garden, owner: @member)
    assign(:garden, @garden)
    render
  end

  it "renders new garden form" 

end

