require 'spec_helper'
require 'openfarm_errors'

describe GardenCrops::CreateGardenCrop do
  let(:cgc) { GardenCrops::CreateGardenCrop }

  let(:user) { FactoryGirl.create(:user) }

  let(:params) do
    { user:      user,
      garden_id: FactoryGirl.create(:garden, user: user).id.to_s,
      attributes: { stage: "#{Faker::Lorem.word}",
                    sowed: "#{Faker::Date.between(2.days.ago, Date.today)}",
                    quantity: rand(100),
                    guide: FactoryGirl.create(:guide).id.to_s }
    }
  end

  it 'requires fields' 


  it 'catches bad garden IDs' 


  it 'catches bad guide IDs' 


  it 'catches bad crop IDs' 


  it 'catches creating gardens not owned by user' 


  it 'catches that there is no crop or guide attached' 


  it 'creates valid garden crops' 

end

