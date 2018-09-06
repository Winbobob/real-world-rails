require 'spec_helper'

describe 'Managing pours' do
  let(:beer_tap) { FactoryGirl.create(:beer_tap, name: 'Main Tap') }
  let(:keg) { FactoryGirl.create(:keg, name: 'Better Beer') }

  before do
    User.create(id: 0, name: 'Guest')
    keg.tap_it(beer_tap.id)
  end

  it 'a new drinker can join' 


  it 'allows an existing user to claim a pour' 


  it 'redirects to the appropriate place after claiming a pour' 


  it "prevents a user with zero credits from starting a pour" 

end

