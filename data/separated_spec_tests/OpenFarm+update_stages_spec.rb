require 'spec_helper'

describe Stages::UpdateStage do
  let(:mutation) { Stages::UpdateStage }

  let(:stage) { FactoryGirl.create(:stage) }

  let(:params) do
    { user: stage.guide.user,
      stage: stage,
      attributes: {} }
  end

  it 'requires fields' 


  it 'minimally requires a user and a stage' 


  it 'updates a stage image via URL' 


  it 'disallows phony URLs' 


  it 'allows an empty stage actions array' 


  it 'allows a well formed stage actions array' 


  it 'disallows a badly formed stage actions array with bad name' 


  it 'allows updating of existing stage actions' 


  it 'deletes images marked for deletion' 

end

