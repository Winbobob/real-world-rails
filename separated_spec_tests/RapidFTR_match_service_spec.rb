require 'spec_helper'

describe MatchService, :type => :request, :solr => true do

  before :each do
    reset_couchdb!

    form = create :form, :name => Child::FORM_NAME

    create :form_section, :name => 'test_form', :fields => [
      build(:text_field, :name => 'name_1', :matchable => true),
      build(:text_field, :name => 'nationality_1', :matchable => true),
      build(:text_field, :name => 'country_1', :matchable => true),
      build(:text_field, :name => 'birthplace_1', :matchable => true),
      build(:text_field, :name => 'languages_1', :matchable => true),
      build(:text_field, :name => 'other_1', :matchable => true)
    ], :form => form

    form = create :form, :name => Enquiry::FORM_NAME

    create :form_section, :name => 'test_form', :fields => [
      build(:text_field, :name => 'name', :matchable => true),
      build(:text_field, :name => 'nationality', :matchable => true),
      build(:text_field, :name => 'country', :matchable => true),
      build(:text_field, :name => 'birthplace', :matchable => true),
      build(:text_field, :name => 'languages', :matchable => true)
    ], :form => form
    Sunspot.remove_all(Child)

    allow(User).to receive(:find_by_user_name).and_return(double(:organisation => 'stc'))
    allow(SystemVariable).to receive(:find_by_name).and_return(double(:value => '0.00'))
  end

  it 'should match children from a country given enquiry criteria with key different from childs country key ' 


  it 'should match records when criteria has a space' 


  it 'should match multiple records given multiple criteria' 


  it 'should not use unmatchable fields to search' 


  it 'should return empty array if criteria is empty' 

end

