require 'rails_helper'

describe "seeds/new" do
  before(:each) do
    @member = FactoryBot.create(:member)
    sign_in @member
    controller.stub(:current_user) { @member }
    @seed1 = FactoryBot.create(:seed, owner: @member)
    assign(:seed, @seed1)
  end

  it "renders new seed form" 


  it 'reminds you to set your location' 


  context 'member has location' do
    before(:each) do
      @member = FactoryBot.create(:london_member)
      sign_in @member
      controller.stub(:current_user) { @member }
      @seed1 = FactoryBot.create(:seed, owner: @member)
      assign(:seed, @seed1)
    end

    it 'shows the location' 


    it 'links to change location' 

  end
end

