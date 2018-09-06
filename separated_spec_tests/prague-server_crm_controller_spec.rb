require 'spec_helper'

describe Org::Settings::CrmController do
  let(:organization) { create(:organization)}
  let(:user) { create(:confirmed_user, organization: organization)}

  before(:each) do
    allow(controller).to receive(:current_organization).and_return( organization )
    sign_in user
  end

  it 'should render new' 


  it 'should render edit' 


  it 'should render show' 

end

