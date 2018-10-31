require 'rails_helper'

describe Admin::ScreenedIpAddressesController do

  it "is a subclass of AdminController" 


  let(:admin) { Fabricate(:admin) }

  before do
    sign_in(admin)
  end

  describe '#index' do
    it 'filters screened ip addresses' 

  end

  describe '#roll_up' do
    it "rolls up 1.2.3.* entries" 


    it "rolls up 1.2.*.* entries" 

  end
end

