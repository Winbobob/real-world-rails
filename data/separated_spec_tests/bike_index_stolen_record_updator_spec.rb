require 'spec_helper'

describe StolenRecordUpdator do
  describe 'create_new_record' do
    it 'creates a new stolen record' 


    it 'calls mark_records_not_current' 

  end

  describe 'updated_phone' do
    it 'does not set the phone if the user already has a phone' 


    it "sets the owner's phone if one is passed in" 

  end

  describe 'create_date_from_string' do
    let(:updator) { StolenRecordUpdator.new(bike: Bike.new) }
    context 'date_time' do
      it 'correctly translates a date string to a date_time' 

    end
    context 'timestamp' do
      it 'correctly translates a date string to a date_time' 

    end
    context 'revised date time version' do
      it 'correctly translates a date string to a date_time' 

    end
  end

  describe 'update_records' do
    it "sets the current stolen record as not current if the bike isn't stolen" 


    it "calls create if a stolen record doesn't exist" 


    it 'sets the date if date_stolen is present' 


    it "marks all stolen records false and mark the bike unrecovered if the bike isn't stolen" 

  end

  describe 'mark_records_not_current' do
    it 'marks all the records not current' 

  end

  describe 'set_creation_organization' do
    it 'sets the creation organization from the bike' 

  end

  describe 'update_with_params' do
    it 'returns the stolen record if no stolen record is associated' 


    it 'sets the data that is submitted' 


    it "creates the associations that it's suppose to" 

  end
end

