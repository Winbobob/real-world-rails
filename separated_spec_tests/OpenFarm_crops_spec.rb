require 'spec_helper'

describe 'Crop pages', type: :controller do
  include IntegrationHelper
  let(:user) { FactoryGirl.create(:user) }
  let(:crop) { FactoryGirl.create(:crop, name: 'radish') }

  it 'shows and edits individual crops' 


  # TODO: How do we test this?
  it 'uploads pictures'

  it 'shows create page for a crop' 


  it 'requires user log in to create a guide' 

end

