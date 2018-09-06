require 'spec_helper'
require 'openfarm_errors'

describe Guides::DestroyGuide do
  let(:mutation) { Guides::DestroyGuide }

  let(:guide) { FactoryGirl.create(:guide) }

  let(:params) do
    { user: guide.user,
      id: "#{guide._id}" }
  end

  it 'requires fields' 


  it 'checks that a guide with the required id exists' 


  # Test for things that use openfarm_errors
end

