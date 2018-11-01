require 'spec_helper'

describe Api::EnquiriesController, :type => :controller do

  before :each do
    reset_couchdb!

    Enquiry.all.each { |enquiry| enquiry.destroy }
    fake_admin_login
    Sunspot.remove_all!

    form = create :form, :name => Enquiry::FORM_NAME

    create :form_section, :name => 'test_form', :fields => [
      build(:text_field, :name => 'name'),
      build(:text_field, :name => 'location'),
      build(:text_field, :name => 'nationality'),
      build(:text_field, :name => 'enquirer_name'),
      build(:numeric_field, :name => 'age'),
      build(:text_field, :name => 'gender')
    ], :form => form
    allow(SystemVariable).to receive(:find_by_name).and_return(double(:value => '0.00'))
  end

  describe '#authorizations' do
    it 'should fail to POST create when unauthorized' 


    it 'should fail to update when unauthorized' 

  end

  describe 'POST create' do

    it 'should trigger the match functionality every time a record is created' 


    it 'should not trigger the match unless record is created' 


    it 'should create the enquiry record and return a success code' 


    it 'should return an enquiry json without internal fields' 


    it 'should not update record if it exists and return error' 


    it 'should not overwrite creation information from mobile' 


    it 'should not duplicate histories from params' 

  end

  describe 'PUT update' do

    it 'should trigger the match functionality every time a record is created' 


    it 'should not include internal fields in the returned json' 


    it 'should not trigger the match unless record is created' 


    it 'should return an error if enquiry does not exist' 


    it 'should merge existing criteria when sending new values in criteria' 


    it 'should update record if it exists and return the updated record' 


    it 'should update record without passing the id in the enquiry params' 


    it 'should merge updated fields and return the latest record' 


    it 'should update existing enquiry with potential matches', :solr => true do
      reset_couchdb!
      form = create :form, :name => Enquiry::FORM_NAME
      create :form_section, :fields => [
        build(:text_field, :name => 'child_name', :matchable => true),
        build(:text_field, :name => 'age', :matchable => true),
        build(:text_field, :name => 'location', :matchable => true),
        build(:text_field, :name => 'sex', :matchable => true)
      ], :form => form

      form = create :form, :name => Child::FORM_NAME
      create :form_section, :fields => [
        build(:text_field, :name => 'name'),
        build(:text_field, :name => 'gender')
      ], :form => form
      Child.reindex!

      allow(Enquiry).to receive(:enquiries_enabled?).and_return(true)
      allow(controller).to receive(:authorize!)
      child1 = Child.create('name' => 'Clayton aquiles', 'created_by' => 'fakeadmin', 'created_organisation' => 'stc')
      child2 = Child.create('name' => 'Steven aquiles', 'gender' => 'male', 'created_by' => 'fakeadmin', 'created_organisation' => 'stc')

      enquiry = Enquiry.create(:enquirer_name => 'Godwin', :sex => 'male', :age => '10', :location => 'Kampala')

      expect(Enquiry.get(enquiry.id).potential_matches.map(&:child)).to include(child2)

      put :update, :id => enquiry.id, :enquiry => {:child_name => 'aquiles', :age => '10', :location => 'Kampala'}
      expect(response.response_code).to eq(200)

      enquiry_after_update = Enquiry.get(enquiry.id)
      expect(enquiry_after_update.potential_matches.size).to eq(2)
      expect(enquiry_after_update.potential_matches.map(&:child)).to include(child1)
      expect(enquiry_after_update.potential_matches.map(&:child)).to include(child2)
      expect(enquiry_after_update['criteria']).to eq('child_name' => 'aquiles', 'age' => '10', 'location' => 'Kampala', 'sex' => 'male')
    end

    it 'should not duplicate or replace histories from params' 

  end

  describe 'GET index' do

    it 'should fetch all the enquiries' 


    it 'should return 422 if query parameter with last update timestamp is not a valid timestamp' 


    describe 'updated after' do
      before :each do
        FormSection.all.each { |fs| fs.destroy }
        form = create(:form, :name => Enquiry::FORM_NAME)
        enquirer_name_field = build(:field, :name => 'enquirer_name')
        child_name_field = build(:field, :name => 'child_name')
        create(:form_section, :name => 'enquiry_criteria', :form => form, :fields => [enquirer_name_field, child_name_field])

        allow(Clock).to receive(:now).and_return(Time.utc(2010, 'jan', 22, 14, 05, 0))
        @enquiry1 = Enquiry.create(:enquirer_name => 'John doe', :child_name => 'any child')
        allow(Clock).to receive(:now).and_return(Time.utc(2010, 'jan', 24, 16, 05, 0))
        @enquiry2 = Enquiry.create(:enquirer_name => 'David', :child_name => 'any child')
      end

      it 'should return all the records created after a specified date' 


      it 'should decode URI encoded params' 


      it 'should return filter records by specified date' 


      it 'should filter records updated after specified date' 

    end

  end

  describe 'GET show' do
    it 'should fetch a particular enquiry' 


    it 'should not return internal fields' 


    it 'should return a 404 with empty body if enquiry record does not exist' 

  end

  describe 'turn off enquiries sync' do
    it 'when enquiries is off should return 404' 


    it 'PUT should return 404 when enquiries is not on' 

  end
end

