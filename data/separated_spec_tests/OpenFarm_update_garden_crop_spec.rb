require 'spec_helper'
require 'openfarm_errors'

describe GardenCrops::UpdateGardenCrop do
  let(:ugc) { GardenCrops::UpdateGardenCrop }

  let(:user) { FactoryGirl.create(:user) }
  let(:garden) { FactoryGirl.create(:garden, user: user) }
  let(:garden_crop) { FactoryGirl.create(:garden_crop, garden: garden) }

  let(:params) do
    { user: user,
      garden_crop: garden_crop,
      attributes: { stage: 'update',
                    sowed: "#{Faker::Date.between(2.days.ago, Date.today)}",
                    quantity: rand(100) } }
  end

  it 'requires fields' 


  it 'catches updating gardens not owned by user' 


  it 'updates valid garden crops' 

end

