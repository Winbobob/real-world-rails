require 'spec_helper'

describe BikeUpdator do
  describe 'find_bike' do
    it "raises an error if it can't find the bike" 

    it 'finds the bike from the bike_params' 

  end

  describe 'ensure_ownership!' do
    it "raises an error if the user doesn't own the bike" 


    it 'returns true if the bike is owned by the user' 

  end

  describe 'update_stolen_record' do
    it 'calls update_stolen_record with the date_stolen_input if it exists' 

    it "creates a stolen record if one doesn't exist" 

  end

  describe 'update_ownership' do
    it 'calls create_ownership if the email has changed' 


    it "does not call create_ownership if the email hasn't changed" 

  end

  describe 'update_available_attributes' do
    it 'does not let protected attributes be updated' 


    it 'marks a bike user hidden' 


    it 'Actually, for now, we let anyone mark anything not stolen' 


    it 'updates the bike and set year to nothing if year nil' 


    it 'updates the bike sets is_for_sale to false' 

  end

  it 'enque listing order working' 

end

