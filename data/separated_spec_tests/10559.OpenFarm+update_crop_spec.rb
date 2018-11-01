require 'spec_helper'
require 'openfarm_errors'

describe Crops::UpdateCrop do
  let(:mutation) { Crops::UpdateCrop }

  let(:user) { FactoryGirl.create(:user) }
  let(:crop) { FactoryGirl.create(:crop) }
  let(:companion_crop) { FactoryGirl.create(:crop) }

  let(:params) do
    { user: user,
      id: "#{crop.id}",
      attributes: { binomial_name: 'updated',
                    description: 'A random description' } }
  end

  it 'requires fields' 


  it 'updates valid crops' 


  it 'updates a crop taxon' 


  it 'updates crop companions' 


  it 'disallows phony URLs' 

end

