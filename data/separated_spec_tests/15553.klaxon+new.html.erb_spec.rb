require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString"
    ))
    @current_user = create(:user)
  end

  it "renders new user form" 

end

