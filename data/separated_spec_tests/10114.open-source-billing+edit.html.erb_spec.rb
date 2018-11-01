require 'rails_helper'

RSpec.describe "expenses/edit", :type => :view do
  before(:each) do
    @expense = assign(:expense, Expense.create!(
      :amount => 1.5,
      :category => "MyString",
      :note => "MyText",
      :client_id => 1
    ))
  end

  it "renders the edit expense form" 

end

