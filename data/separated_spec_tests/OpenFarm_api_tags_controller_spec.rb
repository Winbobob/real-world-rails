require 'spec_helper'
require 'openfarm_errors'

describe Api::V1::TagsController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

  before do
    FactoryGirl.create(:crop, name: 'mung bean', tags: 'tagOne')
    FactoryGirl.create(:crop, tags: 'tagTwo')
    Crop.searchkick_index.refresh
  end

  it 'lists tags' 


  it 'returns the tag matching the query' 

end

