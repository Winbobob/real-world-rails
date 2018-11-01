require 'rails_helper'

describe "plant_parts/show" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @pp = FactoryBot.create(:plant_part)
    @harvest = FactoryBot.create(:harvest, plant_part: @pp)
    assign(:plant_part, @pp)
  end

  it "renders a list of crops harvested for this part" 

end

