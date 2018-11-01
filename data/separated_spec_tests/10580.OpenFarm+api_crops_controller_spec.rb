require 'spec_helper'
require 'openfarm_errors'

describe Api::V1::CropsController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }

  before do
    Crop.destroy_all
    FactoryGirl.create(:crop, name: 'other bean')
    @beans = FactoryGirl.create(:crop, name: 'mung bean')
    FactoryGirl.create_list(:crop, 2)
    Crop.searchkick_index.refresh
  end

  it 'lists crops.' 


  it 'returns [] for tiny searches' 


  it 'should show a crop' 


  it 'should not find a crop' 


  it 'should minimally create a crop' 


  it 'should update a crop' 


  it 'tests whether tags get added as an array', js: true do
    crop = FactoryGirl.create(:crop)
    sign_in user
    put :update,
        id: crop.id,
        data: { attributes: { tags_array: %w(just some tags) } }
    expect(response.status).to eq(200)
    expect(crop.reload.tags_array.length).to eq(3)
  end

  it 'tests whether common names get added as an array', js: true do
    crop = FactoryGirl.create(:crop)
    sign_in user
    put :update,
        id: crop.id,
        data: { attributes: { common_names: ['Radish', 'Red Thing', 'New'] } }
    expect(response.status).to eq(200)
    expect(crop.reload.common_names.length).to eq(3)
  end

  it 'should return an error when updating faulty information' 


  it 'should add a taxon to a crop' 

end

