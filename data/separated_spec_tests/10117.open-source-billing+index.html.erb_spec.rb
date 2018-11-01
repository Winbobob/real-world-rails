require 'rails_helper'

RSpec.describe "expenses/index", :type => :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        :amount => 1.5,
        :category => "Category",
        :note => "MyText",
        :client_id => 1
      ),
      Expense.create!(
        :amount => 1.5,
        :category => "Category",
        :note => "MyText",
        :client_id => 1
      )
    ])
  end

  it "renders a list of expenses" 

end

