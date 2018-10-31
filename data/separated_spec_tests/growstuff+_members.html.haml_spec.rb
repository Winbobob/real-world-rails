require 'rails_helper'

describe 'home/_members.html.haml', type: "view" do
  before(:each) do
    @member = FactoryBot.create(:london_member)
    @member.updated_at = 2.days.ago
    assign(:members, [@member])

    @planting = FactoryBot.create(:planting, owner: @member)
    render
  end

  it 'Has a heading' 


  it 'Shows members' 

end

