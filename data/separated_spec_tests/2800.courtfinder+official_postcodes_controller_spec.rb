require 'spec_helper'

describe Admin::OfficialPostcodesController do

  before :each do
    sign_in User.create!(name: 'hello', admin: true, email: 'lol@biz.info', password: 'irrelevant')
  end

  describe "#validate" do
    let(:postcode) { create(:official_postcode).postcode }

    it "is valid" 


    it "is not valid" 

  end
end

