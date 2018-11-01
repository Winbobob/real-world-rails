require 'rails_helper'

describe "plant_parts/new" do
  before(:each) do
    assign(:plant_part, stub_model(PlantPart,
      name: "MyString").as_new_record)
  end

  it "renders new plant_part form" 

end

