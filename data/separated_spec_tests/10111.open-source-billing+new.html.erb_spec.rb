require 'rails_helper'

RSpec.describe "tasks/new", :type => :view do
  before(:each) do
    assign(:task, Task.new(
      :name => "MyString",
      :description => "MyString",
      :billable => false,
      :rate => "9.99"
    ))
  end

  it "renders new task form" 

end

