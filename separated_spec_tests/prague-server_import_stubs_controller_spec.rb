require 'spec_helper'

describe Org::Settings::Crm::ImportStubsController do
  let(:organization) { create(:organization) }
  let!(:crm) { create(:crm, organization: organization) }
  let(:user) { create(:confirmed_user, organization: organization)}

  before(:each) do
    sign_in user
  end

  it 'should render new' 


  it 'should create a crm stub' 


  it 'should destroy the stub' 

end

