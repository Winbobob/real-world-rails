require 'spec_helper'

describe BikeCreator do
  describe 'include_bike_book' do
    it "returns the bike if stuff isn't present" 

    it 'adds se bike data if it exists' 

  end

  describe 'build_new_bike' do
    it 'calls creator_builder' 

  end

  describe 'build_bike' do
    it 'calls creator_builder' 

  end

  describe 'create_associations' do
    it 'calls creator_associator' 

  end

  describe 'clear_bike' do
    it 'removes the existing bike and transfer the errors to a new active record object' 

  end

  describe 'validate_record' do
    it 'calls remove associations if the bike was created and there are errors' 


    it 'calls delete the already existing bike if one exists' 


    it 'associates the b_param with the bike and clear the bike_errors if the bike is created' 

    describe 'no_duplicate' do
      let(:existing_bike) { FactoryGirl.create(:bike, serial_number: 'some serial number', owner_email: email) }
      let(:new_bike) { FactoryGirl.create(:bike, serial_number: 'some serial number', owner_email: new_email) }
      let!(:ownerships) do
        FactoryGirl.create(:ownership, bike: existing_bike, owner_email: email)
        FactoryGirl.create(:ownership, bike: new_bike, owner_email: new_email)
      end
      let(:params) do
        {
          bike: {
            serial_number: 'some serial number',
            owner_email: new_email,
            no_duplicate: true
          }
        }
      end
      let(:b_param) { FactoryGirl.create(:b_param, creator: existing_bike.current_ownership.creator, params: params ) }
      context 'same email' do
        let(:email) { 'something@gmail.com' }
        let(:new_email) { 'Something@GMAIL.com' }
        it 'finds a duplicate' 

      end
      context 'different email' do
        let(:email) { 'something@gmail.com' }
        let(:new_email) { 'newsomething@gmail.com' }
        it 'does not find a non-duplicate' 

      end
    end
  end

  describe 'save_bike' do
    Sidekiq::Testing.inline! do
      it 'creates a bike with the parameters it is passed and returns it' 

    end

    it 'enque listing order working' 

  end

  describe 'new_bike' do
    it 'calls the required methods' 

  end

  describe 'create_bike' do
    Sidekiq::Testing.inline! do
      it 'saves the bike' 

    end

    it 'returns the bike instead of saving if the bike has errors' 

  end
end

