require 'rails_helper'

RSpec.describe "staffs/new", :type => :view do
  before(:each) do
    assign(:staff, Staff.new(
      :email => "MyString",
      :name => "MyString",
      :rate => "9.99",
      :created_by => 1,
      :updated_by => 1
    ))
  end

  it "renders new staff form" 

end

