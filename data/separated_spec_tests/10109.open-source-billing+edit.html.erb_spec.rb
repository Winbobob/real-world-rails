require 'rails_helper'

RSpec.describe "tasks/edit", :type => :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "MyString",
      :description => "MyString",
      :billable => false,
      :rate => "9.99"
    ))
  end

  it "renders the edit task form" 

end

