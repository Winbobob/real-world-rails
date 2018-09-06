require 'rails_helper'

describe "crops/_grown_for" do
  let(:crop) { FactoryBot.create(:crop) }
  let(:plant_path) { FactoryBot.create(:plant_part) }
  let!(:harvest) do
    FactoryBot.create(:harvest,
      crop: crop,
      plant_part: plant_path)
  end

  it 'shows plant parts' 

end

