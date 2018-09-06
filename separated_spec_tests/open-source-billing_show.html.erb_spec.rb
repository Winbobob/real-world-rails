require 'rails_helper'

RSpec.describe "staffs/show", :type => :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!(
      :email => "Email",
      :name => "Name",
      :rate => "9.99",
      :created_by => 1,
      :updated_by => 2
    ))
  end

  it "renders attributes in <p>" 

end

