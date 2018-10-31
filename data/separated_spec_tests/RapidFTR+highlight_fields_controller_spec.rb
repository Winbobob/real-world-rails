require 'spec_helper'

describe HighlightFieldsController, :type => :controller do

  describe 'index' do
    it 'should have forms assigned' 

  end

  describe 'show' do
    it 'should assign correct form' 


    it 'should assign correct form sections' 


    it 'should assign correct highlighted fields' 


    it 'should return empty array when no highlighted fields exist' 


    it 'should have highlighted fields assigned' 


  end

  describe 'create' do
    it 'should update field as highlighted' 


    it 'should redirect to highlight field page for form' 

  end

  describe 'remove' do
    it 'should unhighlight a field'  do
      field1 = Field.new(:name => 'newfield1', :display_name => 'new_field1_display', :highlight_information => {:order => '1', :highlighted => true})
      form_section = FormSection.new(:name => 'another form section', :unique_id => 'unique_form_section1', :fields => [field1])
      form = double('Form', :id => :id)
      allow(FormSection).to receive(:get_by_unique_id).and_return(form_section)
      allow(form_section).to receive(:form).and_return(form)
      expect(form_section).to receive(:remove_field_as_highlighted).with('newfield1')
      fake_admin_login
      post(:remove, :form_id => 'unique_form_section1', :field_name => 'newfield1')

      expect(response).to redirect_to(highlight_field_url(form))
    end
  end

  describe 'update_title_field' do
    it 'should mark a field as the title field'  do
      field1 = Field.new(:name => 'newfield1', :display_name => 'new_field1_display', :highlight_information => {:order => '1', :highlighted => true})
      form = double('Form', :id => :id)
      expect(form).to receive(:update_title_field).with('newfield1', true)
      form_section = FormSection.new(:name => 'another form section', :unique_id => 'unique_form_section1', :fields => [field1], :form => form)
      allow(FormSection).to receive(:get_by_unique_id).and_return(form_section)
      fake_admin_login
      post(:update_title_field, :form_id => 'unique_form_section1', :field_name => 'newfield1', :value => 'true')
      expect(response).to be_ok
      expect(response.body).to eq('{}')
    end
  end
end

