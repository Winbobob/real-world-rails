require 'spec_helper'

describe Search do
  before :each do
    @entities = {
        DataModel::Gene => :name,
        DataModel::Drug => :name,
        DataModel::GeneClaimAlias => :alias,
        DataModel::DrugClaimAlias => :alias,
        DataModel::GeneClaim => :name,
        DataModel::DrugClaim => :name
    }
  end

  it 'should use the textacular .advanced_search to leverage postgres full text search' 


  it 'should throw an exception if given a blank or nil input' 


  it 'should wrap results in SearchResultPresenter objects' 


  it 'should search the correct field for each entity type' 

end

