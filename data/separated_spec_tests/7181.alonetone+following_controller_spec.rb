require "rails_helper"

RSpec.describe FollowingController, type: :controller do
  fixtures :users

  context 'follow' do
    it 'should increment following count by one' 


    it 'should not let you follow someone twice' 

  end

  context 'unfollow' do
    it 'should decrement following count by one' 


    it 'should not let you unfollow someone you do not already follow' 

  end
end

