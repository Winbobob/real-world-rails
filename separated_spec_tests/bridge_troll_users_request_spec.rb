require 'rails_helper'

describe "the users page", js: true do
  before do
    sign_in_as(create(:user, first_name: 'Some', last_name: 'LoggedInUser'))
    create(:user, first_name: 'Some', last_name: 'OtherUser')
    create(:meetup_user, full_name: 'Some MeetupUser')
  end

  it "shows a list of users" 

end

