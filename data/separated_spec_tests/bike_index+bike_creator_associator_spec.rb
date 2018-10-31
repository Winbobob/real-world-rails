require 'spec_helper'

describe BikeCreatorAssociator do
  describe 'create_ownership' do
    it 'calls create ownership' 

    it 'calls create ownership with send_email false if b_param has that' 

  end

  describe 'create_components' do
    it 'calls create components' 

  end

  describe 'create_normalized_serial_segments' do
    it 'calls create components' 

  end

  describe 'create_stolen_record' do
    it 'calls create stolen record' 

  end

  describe 'add_other_listings' do
    it 'calls create stolen record' 

  end

  describe 'attach_photo' do
    it 'creates public images for the attached image' 

  end

  # describe 'add_uploaded_image' do
  #   it "associates the public image" do
  #     bike = FactoryGirl.create(:bike)
  #     b_param = FactoryGirl.create(:b_param)
  #     b_param.params = {bike: {bike_image: File.open(File.join(Rails.root, 'spec', 'fixtures', 'bike.jpg'))}}
  #     b_param.save
  #     BikeCreatorAssociator.new(b_param).add_uploaded_image(bike)
  #     bike.reload.public_images.count.should eq(1)
  #   end
  # end

  describe 'associate' do
    it 'calls the required methods' 

    it 'rescues from the error and add the message to the bike' 

  end
end

