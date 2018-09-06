require 'spec_helper'

describe "View Keg" do
  let(:tap) { FactoryGirl.create(:beer_tap) }
  let(:keg) { FactoryGirl.create(:keg, name: "Better Beer") }

  before do
    keg.tap_it(tap.id)
  end

  it "shows immediately after a keg has been tapped" 


  context "after pours" do
    it "shows pours and leaderboard correctly" 

  end
end

