require 'spec_helper'

describe Api::V1::StagesController, type: :controller do
  include ApiHelpers

  let!(:user) { sign_in(user = FactoryGirl.create(:user)) && user }
  let(:guide) { FactoryGirl.create(:guide, user: user) }
  let(:stage) { FactoryGirl.create(:stage, guide: user) }

  before do
    @guide = FactoryGirl.create(:guide, name: 'lee\'s mung bean')
  end

  it 'creates stages' 


  it 'should return an error when wrong info is passed to create' 


  it 'should return an error when a guide does not exist' 


  it 'should show a specific stage' 


  it 'should update a stage' 


  it 'cant create a stage on someone elses guide' 


  it 'should not update a stage on someone elses guide' 


  it 'deletes stages' 


  it 'only destroys stages owned by the user' 


  it 'handles deletion of unknown stages' 


  it 'has a picture route, which returns empty when there are no pictures' 


  it 'has a picture route, which returns with pictures' 


  it 'should add actions in a stage creation event successfully' 


  it 'should remove actions from stages'

  it 'should reject stage actions without a name' 


  it 'should accept stage actions without an overview' 


  it 'should only add actions to stages that the user owns the guide of'

  it 'should only remove actions from stages that the user owns the guide of'

  it 'should only update actions to stages that the user owns the guide of'
end

