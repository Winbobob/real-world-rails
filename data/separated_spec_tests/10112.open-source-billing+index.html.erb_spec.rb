require 'rails_helper'

RSpec.describe "tasks/index", :type => :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :name => "Name",
        :description => "Description",
        :billable => false,
        :rate => "9.99"
      ),
      Task.create!(
        :name => "Name",
        :description => "Description",
        :billable => false,
        :rate => "9.99"
      )
    ])
  end

  it "renders a list of tasks" 

end

