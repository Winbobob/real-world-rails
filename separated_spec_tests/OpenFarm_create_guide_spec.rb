require 'spec_helper'

describe Guides::CreateGuide do
  let(:cg) { Guides::CreateGuide }

  let(:params) do
    { user: FactoryGirl.create(:user),
      crop_id: FactoryGirl.create(:crop).id.to_s,
      id: FactoryGirl.create(:guide).id.to_s,
      attributes: { name: 'hi.' }
    }
  end

  it 'requires fields' 


  it 'requires a name' 


  it 'validates invalid URLs' 


  it 'allows valid URLS' 


  it 'catches bad crop IDs' 


  it 'catches bad crop IDs but saves with a good crop name' 


  it 'creates valid guides' 


  it 'catches invalid practices' 


  it 'knows to choose a crop based on a crop name' 


  it 'creates an associated timespan object' 

end

