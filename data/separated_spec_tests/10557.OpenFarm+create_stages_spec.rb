require 'spec_helper'
require 'openfarm_errors'

describe Stages::CreateStage do
  let(:mutation) { Stages::CreateStage }
  let(:guide) { FactoryGirl.create(:guide) }
  let(:params) do
    { user: guide.user,
      attributes: { name: "#{Faker::Name.last_name}",
                    order: 0 },
      guide_id: "#{guide._id}" }
  end

  it 'minimally requires a user and a guide to be true' 


  it 'disallows making stages for guides that are not a users' 


  it 'creates a stage image via URL' 


  it 'disallows phony URLs' 


  it 'uploads multiple images' 


  it 'allows an empty stage actions array' 


  it 'allows a well formed stage actions array' 


  it 'allows a well formed stage actions array with order' 


  it 'allows images in stage actions' 

end

