require 'rails_helper'

describe "plant_parts/index" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @pp = FactoryBot.create(:plant_part)
    assign(:plant_parts, [@pp])
  end

  it "renders a list of plant_parts" 

end

