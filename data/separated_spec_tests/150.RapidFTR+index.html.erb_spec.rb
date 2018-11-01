require 'spec_helper'

describe 'enquiries/index.html.erb', :type => :view do

  before :each do
    @form_sections = []

    form = create(:form, :name => Enquiry::FORM_NAME)
    @form_sections << create(:form_section, :unique_id => 'enquiry_criteria', :name => 'Enquiry Criteria', :form => form,
                             :fields => [build(:field, :name => 'enquirer_name', :display_name => 'Enquirer Name'), build(:field, :name => 'child_name', :display_name => 'Child Name')])
    @form_sections << create(:form_section, :unique_id => 'potential_matches', :name => 'Matches', :form => form)

    @highlighted_fields = [
      Field.new(:name => 'enquirer_name', :display_name => 'Enquiry Criteria', :visible => true),
      Field.new(:name => 'child_name', :display_name => 'child_name', :visible => true)]
    allow(Form).to receive(:find_by_name).and_return(double('Form', :sorted_highlighted_fields => @highlighted_fields, :title_fields => []))
  end

  it 'display all enquiries' 

end

