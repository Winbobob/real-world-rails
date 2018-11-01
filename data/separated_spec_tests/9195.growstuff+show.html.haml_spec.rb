require 'rails_helper'

describe "places/show" do
  before(:each) do
    @member = FactoryBot.create(:london_member)
    @nearby_members = [FactoryBot.create(:member)]
    controller.stub(:current_user) { @member }
    controller.stub(:current_member) { @member }
    @place = @member.location
    render
  end

  it "shows the selected place" 


  it "shows the selected place in the textbox" 


  it "shows the names of nearby members" 

end

