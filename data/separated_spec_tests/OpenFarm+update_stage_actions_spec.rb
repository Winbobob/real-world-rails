require 'spec_helper'
require 'openfarm_errors'

describe StageActions::UpdateStageAction do
  let(:mutation) { StageActions::UpdateStageAction }
  let(:stage) { FactoryGirl.create(:stage) }
  let(:stage_action) { FactoryGirl.create(:stage_action, stage: stage) }
  let(:params) do
    { user: stage.guide.user,
      id: "#{stage_action._id}",
      stage_id: "#{stage._id}",
      attributes: { name: "#{Faker::Name.last_name}",
                    overview: "#{Faker::Lorem.paragraph}" } }
  end

  it 'minimally runs the mutation' 


  it 'disallows making actions for stages that are not a users' 


  it 'uploads multiple images' 


  it 'disallows phony URLs' 

end

