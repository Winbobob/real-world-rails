require 'rails_helper'

describe 'layouts/application.html.haml', type: "view" do
  before(:each) do
    controller.stub(:current_user) { nil }
  end

  it 'includes the analytics code' 

end

