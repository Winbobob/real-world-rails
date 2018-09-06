require 'rails_helper'

describe "crops/hierarchy" do
  before(:each) do
    controller.stub(:current_user) { nil }
    @tomato = FactoryBot.create(:tomato)
    @roma = FactoryBot.create(:crop, name: 'Roma tomato', parent: @tomato)
    assign(:crops, [@tomato, @roma])
    render
  end

  it "shows crop hierarchy" 

end

