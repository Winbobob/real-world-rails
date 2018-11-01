require 'spec_helper'
require 'openfarm_errors'

describe Gardens::DestroyGarden do
  let(:mutation) { Gardens::DestroyGarden }

  let(:garden) { FactoryGirl.create(:garden) }

  let(:params) do
    { user: garden.user,
      id: "#{garden._id}" }
  end

  it 'requires fields' 


  it 'checks that a garden with the required id exists' 


  # Test for things that use openfarm_errors
end

