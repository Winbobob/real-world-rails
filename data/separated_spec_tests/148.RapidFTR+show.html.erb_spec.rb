require 'spec_helper'

describe 'enquiries/show.html.erb', :type => :view do

  before :each do
    reset_couchdb!
    @user = double('user', :has_permission? => true, :user_name => 'name', :id => 'test-user-id')
    @form_sections = []
    @potential_matches = []

    form = create(:form, :name => Enquiry::FORM_NAME)
    field1 = build(:field, :name => 'field_2', :display_name => 'field display 2', :visible => true, :highlighted => true)
    field2 = build(:field, :name => 'field_4', :display_name => 'field display 4', :visible => true, :highlighted => true)
    @form_sections << create(:form_section, :unique_id => 'enquiry_criteria', :name => 'Enquiry Criteria', :form => form, :fields => [build(:field, :name => 'enquirer_name'), field1, field2])
    @form_sections << create(:form_section, :unique_id => 'potential_matches', :name => 'Matches', :form => form)

    @enquiry = create(:enquiry, :enquirer_name => 'Foo Bar', :child_name => 'John Doe', :created_at => 'July 19 2010 13:05:32UTC')

    allow(@user).to receive(:localize_date).and_return('July 19 2010 13:05:32UTC')
    allow(controller).to receive(:current_user).and_return(@user)
    allow(view).to receive(:current_user).and_return(@user)
    allow(view).to receive(:logged_in?).and_return(true)
    allow(view).to receive(:current_user_name).and_return('name')
    assign(:forms_sections, @form_sections)
    assign(:enquiry, @enquiry)
    assign(:current_user, User.new)

  end

  it 'display all form sections for the enquiries form' 


  it 'should render sidebar' 


  it 'displays the enquiry photo' 


  it 'display potential matches section' 


  describe 'rendering matching child partial' do
    it 'should a have link to mark child as not a match' 


    it 'should not have link to mark child as not a match when flag is not passed' 


  end
end

