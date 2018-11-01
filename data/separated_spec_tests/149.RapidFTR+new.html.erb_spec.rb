require 'spec_helper'

describe 'enquiries/new.html.erb', :type => :view do

  before :each do
    @form_section = build :form_section, :name => 'section_name', :unique_id => 'section_name'
    assign(:form_sections, [@form_section])
    @enquiry = Enquiry.new
    assign(:enquiry, @enquiry)
  end

  it 'should return a form that posts to the enquiry url' 


  it 'should render form_sections partial with an enquiry' 


end

