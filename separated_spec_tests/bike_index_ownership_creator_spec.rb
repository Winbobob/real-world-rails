require 'spec_helper'

describe OwnershipCreator do
  describe 'owner_id' do
    it 'finds the user' 

    it "returns false if the user doesn't exist" 

  end

  describe 'find_owner_email' do
    it 'is the bike params unless owner_email is present' 

  end

  describe 'send_notification_email' do
    it 'sends a notification email' 


    it 'does not send a notification email for example bikes' 


    it 'does not send a notification email for ownerships with no_email set' 

  end

  describe 'new_ownership_params' do
    it 'creates new ownership attributes' 


    it 'creates a current new ownership if the ownership is created by the same person' 

  end

  describe 'mark_other_ownerships_not_current' do
    it 'marks existing ownerships as not current' 

  end

  describe 'current_is_hidden' do
    it 'returns true if existing ownerships is user hidden' 

    it 'returns false' 

  end

  describe 'add_errors_to_bike' do
    xit 'adds the errors to the bike' do
      ownership = Ownership.new
      bike = Bike.new
      ownership.errors.add(:problem, 'BALLZ')
      creator = OwnershipCreator.new(bike: bike)
      creator.add_errors_to_bike(ownership)
      expect(bike.errors.messages[:problem]).to eq('BALLZ')
    end
  end

  describe 'create_ownership' do
    it 'calls mark not current and send notification and create a new ownership' 

    it 'calls mark not current and send notification and create a new ownership' 

  end
end

