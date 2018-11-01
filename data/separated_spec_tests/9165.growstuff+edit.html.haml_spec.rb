require 'rails_helper'

describe "comments/edit" do
  before(:each) do
    controller.stub(:current_user) { nil }
    assign(:comment, FactoryBot.create(:comment))
  end

  it "renders the edit comment form" 

end

