require 'rails_helper'

describe 'home/_seeds.html.haml', type: "view" do
  before(:each) do
    @owner = FactoryBot.create(:london_member)
    @seed = FactoryBot.create(:tradable_seed, owner: @owner)
    render
  end

  it 'has a heading' 


  it 'lists seeds' 

end

