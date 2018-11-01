require 'rails_helper'

RSpec.describe "staffs/index", :type => :view do
  before(:each) do
    assign(:staffs, [
      Staff.create!(
        :email => "Email",
        :name => "Name",
        :rate => "9.99",
        :created_by => 1,
        :updated_by => 2
      ),
      Staff.create!(
        :email => "Email",
        :name => "Name",
        :rate => "9.99",
        :created_by => 1,
        :updated_by => 2
      )
    ])
  end

  it "renders a list of staffs" 

end

