require 'rails_helper'

RSpec.describe "tasks/show", :type => :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :name => "Name",
      :description => "Description",
      :billable => false,
      :rate => "9.99"
    ))
  end

  it "renders attributes in <p>" 

end

