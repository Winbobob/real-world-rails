require 'rails_helper'

feature "User's can interact with notifications" do
  let!(:person) { create(:person) }
  let!(:notification) {
    create(:notification, message: 'a new message', person: person) }

  context "an authenticated user" do
    before { login_user(person) }

    it "can view their notifications" 

  end
end

