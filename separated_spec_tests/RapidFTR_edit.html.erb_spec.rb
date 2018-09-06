require 'spec_helper'

describe 'enquiries/edit.html.erb', :type => :view do
  before :all do
    form = create(:form, :name => Enquiry::FORM_NAME)
    fields = [build(:field, :name => 'enquirer_name')]
    @form_sections = [create(:form_section, :name => 'Enquiry Criteria', :form => form, :fields => fields)]
    @enquiry = create(:enquiry, :enquirer_name => 'John Doe')
  end

  before :each do
    assign(:form_sections, @form_sections)
    assign(:enquiry, @enquiry)
    allow(User).to receive(:find_by_user_name).with('me').and_return(double(:organisation => 'stc'))
    user = User.new
    user.stub(:permissions => Permission::USERS[:create_and_edit])
    allow(controller).to receive(:current_user).and_return(user)
  end

  it 'should render form that posts to enquiries path' 


  it 'should render partial shared/_tabs with form_sections' 


  it 'should render partial shared/_form_sections' 

end

