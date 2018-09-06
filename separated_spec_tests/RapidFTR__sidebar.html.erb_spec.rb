require 'spec_helper'

describe 'shared/_sidebar.html.erb', :type => :view do
  let!(:user) do
    user = User.new
    user.stub(:user_name => 'test_user')
    user.stub(:permissions => [Permission::USERS[:create_and_edit], Permission::ENQUIRIES[:create], Permission::ENQUIRIES[:update], Permission::CHILDREN[:edit]])
    user
  end
  let(:child) { create :child, :photo => uploadable_photo_jeff, :created_by => user.user_name }
  let(:enquiry) { create :enquiry, :photo => uploadable_photo_jeff, :created_by => user.user_name }

  before :each do
    reset_couchdb!
    form = create :form, :name => Enquiry::FORM_NAME
    form_section = create :form_section, :form => form, :name => 'basic_details', :fields => [build(:photo_field, :name => 'photo')]
    assign(:form_sections, [form_section])
    allow(User).to receive(:find_by_user_name).with('test_user').and_return(double(:organisation => 'stc'))
    allow(controller).to receive(:current_user).and_return(user)
  end

  it 'should display manage and edit photo links for child' 


  it 'should not display manage and edit photo links for enquiry' 


  it 'should load enquiry photo given an enquiry' 


  it 'should load child photo given a child' 


  it 'should load empty image if the model has no photo' 

end

