require 'spec_helper'

describe 'shared/_form_section.html.erb', :type => :view do

  before :each do
    @form_section = FormSection.new 'unique_id' => 'translated', 'name' => 'displayed_form_name'
  end

  describe 'translating form section name' do
    it 'should be shown with translated name' 


    it 'should not be shown with translated name' 

  end

  describe 'translating form section heading' do
    it 'should be shown with translated heading' 


    it 'should not be shown with translated heading' 

  end

  describe 'rendering text fields' do

    context 'new record' do

      it 'renders text fields with a corresponding label' 

    end

    context 'existing record' do

      it 'prepopulates the text field with the existing value' 

    end
  end

  describe 'rendering radio buttons' do

    context 'new record' do

      it 'renders radio button fields' 

    end

    context 'existing record' do

      it 'renders a radio button with the current option selected' 

    end
  end

  describe 'rendering select boxes' do

    context 'new record' do

      it 'render select boxes' 

    end
  end

  context 'existing record' do

    it 'renders a select box with the current value selected' 

  end

  describe 'rendering check boxes' do

    context 'existing record' do

      it 'renders checkboxes as checked if the underlying field is set to Yes' 


    end
  end

  # TODO: Date picker must be implemented in Advanced Search Page

  # describe "rendering date field" do

  # context "new record" do
  #  it "renders date field" do
  #    @child = Child.new
  #    @form_section.add_field build(:date_field, name: 'some_date')
  #
  #    render :partial => 'children/form_section', :locals => { :form_section => @form_section }, :formats => [:html], :handlers => [:erb]
  #    rendered.should be_include("label for=\"child_some_date\"")
  #    rendered.should be_include("<input id=\"child_some_date\" name=\"child[some_date]\" type=\"text\" />")
  #    rendered.should be_include("<script type=\"text/javascript\">\n//<![CDATA[\n$(document).ready(function(){ $(\"#child_some_date\").datepicker({ dateFormat: 'dd M yy' }); });\n//]]>\n</script>")
  #  end
  # end
  #
  # context "existing record" do
  #
  #  it "renders date field with the previous date" do
  #    @child = Child.new :some_date => "13/05/2004"
  #    @form_section.add_field build(:date_field, name: 'some_date')
  #
  #    render :partial => 'children/form_section', :locals => { :form_section => @form_section }, :formats => [:html], :handlers => [:erb]
  #
  #
  #    rendered.should be_include("<input id=\"child_some_date\" name=\"child[some_date]\" type=\"text\" value=\"13/05/2004\" />")
  #    rendered.should be_include("<script type=\"text/javascript\">\n//<![CDATA[\n$(document).ready(function(){ $(\"#child_some_date\").datepicker({ dateFormat: 'dd M yy' }); });\n//]]>\n</script")
  #  end
  #
  # end
  # end

end

