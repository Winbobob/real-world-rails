require 'rails_helper'

RSpec.describe "staffs/edit", :type => :view do
  before(:each) do
    @staff = assign(:staff, Staff.create!(
      :email => "MyString",
      :name => "MyString",
      :rate => "9.99",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders the edit staff form" 

end

