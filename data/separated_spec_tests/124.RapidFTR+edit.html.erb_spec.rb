require 'spec_helper'
require 'nokogiri'

describe 'form_section/edit.html.erb', :type => :view do
  before :each do
    form = build :form, :id => 'foo'
    assign(:form, form)
  end

  it 'should not allow to show/hide fields for non editable form sections' 


  it 'should not have Down or Up UI elements for uneditable field' 


  it 'should be blank if the options is empty' 


  it 'should have the options if the options strings text is not empty' 


  it 'should not have edit or delete or enable UI elements for uneditable fields' 


  it 'should display forms in system language when user language is different' 


end

