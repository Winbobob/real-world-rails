require 'spec_helper'

class Schema
end

describe 'children/show.html.erb', :type => :view do

  describe "displaying a child's details" do
    before :each do
      @user = double('user', :has_permission? => true, :user_name => 'name', :id => 'test-user-id')
      allow(controller).to receive(:current_user).and_return(@user)
      allow(view).to receive(:current_user).and_return(@user)
      allow(view).to receive(:logged_in?).and_return(true)
      allow(view).to receive(:current_user_name).and_return('name')
      @form_section = FormSection.new :unique_id => 'section_name', :visible => 'true'
      @child = Child.create(:name => 'fakechild', :age => '27', :gender => 'male', :date_of_separation => '1-2 weeks ago', :unique_identifier => 'georgelon12345', :created_by => 'jsmith', :created_at => 'July 19 2010 13:05:32UTC', :photo => uploadable_photo_jeff)
      allow(@child).to receive(:has_one_interviewer?).and_return(true)
      allow(@child).to receive(:short_id).and_return('2341234')

      assign(:form_sections, [@form_section])
      assign(:child, @child)
      assign(:current_user, User.new)
      assign(:duplicates, Array.new)
    end

    it "displays the child's photo" 


    it 'renders all fields found on the FormSection' 


    it 'does not render fields found on a disabled FormSection' 


    describe 'interviewer details' do
      it 'should show registered by details and no link to change log if child has not been updated' 


      it 'should show link to change log if child has been updated by multiple people' 


      it 'should not show link to change log if child was registered by and updated again by only the same person' 


      it 'should always show the posted at details when the record has been posted from a mobile client' 


      it 'should not show the posted at details when the record has not been posted from mobile client' 

    end

    context 'export button' do
      it "should not show links to export when user doesn't have appropriate permissions" 


      it 'should show links to export when user has appropriate permissions' 

    end

    context 'when enquiries are turned off' do
      before :each do
        @enable_enquiries = SystemVariable.create!(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => 0)
      end

      after :each do
        @enable_enquiries.destroy
      end

      it 'should not show matches tab when enquiries are turned off' 


      it 'should not show mark as reunited button' 


    end

    context 'when enquiries are turned on' do
      before :each do
        @enable_enquiries = SystemVariable.create!(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => 1)
      end

      after :each do
        @enable_enquiries.destroy
      end

      it 'should show matches tab' 


      it 'should show mark as reunited button' 

    end
  end
end

