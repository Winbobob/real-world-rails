require 'spec_helper'

describe BikeDecorator do
  describe 'show_other_bikes' do
    it 'links to bikes if the user is the current owner and wants to share' 

  end

  describe 'bike_show_twitter_and_website' do
    it 'calls the method from application decorator' 

  end

  describe 'title' do
    it 'returns the major bike attribs formatted' 

  end

  describe 'phoneable_by' do
    it "does not return anything if there isn't a stolen record" 

    it 'returns true if users can see it' 


    it 'returns true if users can see it and user is there' 


    it 'returns true if shops can see it and user has shop membership' 


    it 'returns true if police can see it and user is police' 


    it 'returns true for superusers' 

  end

  describe 'tire_width' do
    it 'returns wide if false' 

    it 'returns narrow if narrow' 

  end

  describe 'list_link_url' do
    it 'returns the bike edit path if edit' 


    it 'returns the normal path if passed' 

  end

  describe 'thumb_image' do
    context 'bike photo exists' do
      it 'returns the thumb path if one exists' 

    end
    context 'bike photo does not exist' do
      it 'returns the bike placeholder path' 

    end 
  end

  describe 'list_image' do
    it 'returns the link with  thumb path if nothing is passed' 

    it 'returns the images thumb path' 

  end

  describe 'serial_display' do
    context 'absent' do
      context 'stolen' do
        it 'unknown' 

      end
      context 'not stolen' do
        it 'unknown' 

      end
      context 'made_without_serial' do
        it 'Has no serial' 

      end
    end
    context 'recovered' do
      it 'returns hidden' 

    end

    it 'returns serial number' 

  end
end

