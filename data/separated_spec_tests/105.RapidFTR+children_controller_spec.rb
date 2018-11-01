require 'spec_helper'

describe Api::ChildrenController, :type => :controller do

  before :each do
    fake_admin_login
  end

  describe '#authorizations' do
    it 'should fail GET index when unauthorized' 


    it 'should fail GET show when unauthorized' 


    it 'should fail to POST create when unauthorized' 

  end

  describe 'GET index' do
    it 'should render all children as json' 

  end

  describe 'updated after' do
    before :each do
      reset_couchdb!
      FormSection.all.each { |fs| fs.destroy }
      form = create(:form, :name => Child::FORM_NAME)
      child_name_field = build(:field, :name => 'child_name')
      location_field = build(:field, :name => 'location')
      create(:form_section, :name => 'basic_details', :form => form, :fields => [child_name_field, location_field])
      allow(User).to receive(:find_by_user_name).with('uname').and_return(@user = double('user', :user_name => 'uname', :organisation => 'org'))

      allow(Clock).to receive(:now).and_return(Time.utc(2010, 'jan', 22, 14, 05, 0))
      @child1 = Child.new_with_user_name(@user, :child_name => 'John Doe', :location => 'Kampala')
      @child1.save!

      allow(Clock).to receive(:now).and_return(Time.utc(2010, 'jan', 24, 14, 05, 0))
      @child2 = Child.new_with_user_name(@user, :child_name => 'David', :location => 'Kampala')
      @child2.save!
    end

    it 'should return all records created after a specified date' 


    it 'should decode URI encoded strings' 


    it 'should return filtered records by specified date' 


    it 'should filter records updated after specified date' 

  end

  describe 'GET show' do
    it 'should render a child record as json' 


    it 'should return a 404 with empty body if no child record is found' 


    it 'should return a 403 if the device is blacklisted' 

  end

  describe 'POST create' do
    it 'should update the child record instead of creating if record already exists' 


    it 'should not duplicate histories from params' 


    it 'should not return histories' 

  end

  describe 'PUT update' do
    it 'should allow a records ID to be specified to create a new record with a known id' 


    it 'should not duplicate or replace histories from params' 


    it 'should not return histories' 

  end

  describe '#unverified' do
    before :each do
      @user = build :user, :verified => false, :role_ids => []
      fake_login @user
    end

    it 'should mark all children created as verified/unverifid based on the user' 


    it 'should set the created_by name to that of the user matching the params' 


    it 'should update the child instead of creating new child everytime' 


    it 'should not return histories for existing children' 


    it 'should not return histories for new children' 

  end
end

