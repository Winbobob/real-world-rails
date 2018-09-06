require 'spec_helper_min'

describe Carto::SamlController do
  before(:all) do
    @organization = FactoryGirl.create(:saml_organization)
  end

  after(:all) do
    @organization.destroy
  end

  it 'shows SAML metadata' 


  it 'returns an error for non-existing organizations' 


  it 'returns an error for non-configured organizations' 

end

