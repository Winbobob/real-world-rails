require 'rails_helper'

RSpec.describe "expenses/new", :type => :view do
  before(:each) do
    assign(:expense, Expense.new(
      :amount => 1.5,
      :category => "MyString",
      :note => "MyText",
      :client_id => 1
    ))
  end

  it "renders new expense form" 

end

