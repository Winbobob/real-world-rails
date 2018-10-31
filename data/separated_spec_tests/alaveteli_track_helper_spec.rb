# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TrackHelper do

  include TrackHelper
  include LinkToHelper

  describe 'when displaying notices for a search track' do

    before do
      @track_thing = FactoryGirl.build(:search_track)
    end

    it 'should create an already subscribed_notice' 


    it 'should create an email subscription notice' 


    it 'should create a following subscription notice' 


    it 'should create an unsubscribe notice' 


    it 'should create a description of the track' 


  end

  describe 'when displaying notices for a user track' do

    before do
      @track_thing = FactoryGirl.build(:user_track)
    end

    it 'should create an already subscribed_notice' 


    it 'should create an email subscription notice' 


    it 'should create a following subscription notice' 


    it 'should create an unsubscribe notice' 


    it 'should create a description of the track' 


  end

  describe 'when displaying notices for a public body track' do

    before do
      @track_thing = FactoryGirl.build(:public_body_track)
    end

    it 'should create an already subscribed_notice' 


    it 'should create an email subscription notice' 


    it 'should create a following subscription notice' 


    it 'should create an unsubscribe notice' 


    it 'should create a description of the track' 

  end

  describe 'when displaying notices for a successful request track' do

    before do
      @track_thing = FactoryGirl.build(:successful_request_track)
    end

    it 'should create an already subscribed_notice' 


    it 'should create an email subscription notice' 


    it 'should create a following subscription notice' 


    it 'should create an unsubscribe notice' 


    it 'should create a description of the track' 

  end

  describe 'when displaying notices for a new request track' do

    before do
      @track_thing = FactoryGirl.build(:new_request_track)
    end

    it 'should create an already subscribed_notice' 


    it 'should create an email subscription notice' 


    it 'should create a following subscription notice' 


    it 'should create an unsubscribe notice' 


    it 'should create a description of the track' 


  end

  describe 'when displaying notices for a request update track' do

    before do
      @track_thing = FactoryGirl.build(:request_update_track)
    end

    it 'should create an already subscribed_notice' 


    it 'should create an email subscription notice' 


    it 'should create a following subscription notice' 


    it 'should create an unsubscribe notice' 


    it 'should create a description of the track' 


  end

end

