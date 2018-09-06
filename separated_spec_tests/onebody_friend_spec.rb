require 'rails_helper'

describe 'Friend', type: :request do
  before do
    Setting.set(1, 'Features', 'Friends', true)
    @user = FactoryGirl.create(:person)
    @friend = FactoryGirl.create(:person)
    @stranger = FactoryGirl.create(:person)
    Friendship.create!(person: @user, friend: @friend)
  end

  it 'has proper links' 

end

