require 'spec_helper'

describe 'children/_form_section_info.html.erb', :type => :view do
  before { FormSection.all.each(&:destroy) }

  it 'should show form section description and help text' 


  it 'should show form section description but no help text' 


  it 'should show help text but no form section description' 


  it 'should show neither' 


end

