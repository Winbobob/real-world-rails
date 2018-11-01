require 'rails_helper'

describe "seeds/edit" do
  before(:each) do
    @member = FactoryBot.create(:member)
    sign_in @member
    controller.stub(:current_user) { @member }
    @seed = FactoryBot.create(:seed, owner: @member)
  end

  it "renders the edit seed form" 


  it "doesn't revert tradable_to to nowhere" 

end

