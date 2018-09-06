require 'spec_helper'
require 'openfarm_errors'

describe StageActions::CreateStageAction do
  let(:mutation) { StageActions::CreateStageAction }
  let(:stage) { FactoryGirl.create(:stage) }
  let(:params) do
    { user: stage.guide.user,
      id: "#{stage._id}",
      attributes: { name: "#{Faker::Name.last_name}",
                    overview: "#{Faker::Lorem.paragraph}" } }
  end

  it 'minimally runs the mutation' 


  it 'disallows making actions for stages that are not a users' 


  it 'uploads multiple images' 


  it 'disallows phony URLs' 


  it 'disallows making actions for stages that do not exist' 

end

