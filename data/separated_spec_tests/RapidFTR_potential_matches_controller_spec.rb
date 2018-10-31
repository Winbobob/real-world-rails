require 'spec_helper'

describe PotentialMatchesController, :type => :controller do

  before :each do
    reset_couchdb!
    FormSection.all.each { |fs| fs.destroy }
    fake_field_worker_login
    allow(SystemVariable).to receive(:find_by_name).and_return(double(:value => '0.00'))
    @child = create(:child, :name => 'John Doe', :gender => 'male')
    form = create(:form, :name => Enquiry::FORM_NAME)
    @form_section = create(:form_section, :name => 'enquiry_criteria', :form => form, :fields => [build(:text_field, :name => 'enquirer_name')])
    allow(MatchService).to receive(:search_for_matching_children).and_return(@child.id => '0.1')
    @enquiry = create(:enquiry, :enquirer_name => 'Foo Bar')
    allow(controller.current_ability).to receive(:can?).with(:update, Enquiry).and_return(true)
  end

  describe 'destroy' do
    it 'should remove child id from potential matches ' 


    it 'should redirect to potential matches section of enquiry page after marking child as not matching' 


    it 'should redirect to potential matches section of child page if specified' 


    it 'should reject unauthorized users' 

  end

  describe 'update' do
    it 'should confirm a potential match' 


    it 'should redirect to potential matches section of enquiry page' 


    it 'should redirect to potential matches section of child page if specificed' 


    it 'should reject unauthorize users' 

  end
end

