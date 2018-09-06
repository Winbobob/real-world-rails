require 'spec_helper'

describe Gardens::UpdateGarden do
  let(:mutation) { Gardens::UpdateGarden }

  let(:garden) { FactoryGirl.create(:garden) }

  let(:params) do
    { user: garden.user,
      id: "#{garden._id}",
      attributes: {} }
  end

  it 'requires fields' 


  it 'minimally requires a user and a garden' 


  it 'tests this' 


  it 'updates a garden image via URL' 


  it 'disallows phony URLs' 


  it 'deletes images marked for deletion' 


  it 'does not edit existing images' 

end

