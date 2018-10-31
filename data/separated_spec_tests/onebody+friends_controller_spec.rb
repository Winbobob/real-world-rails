require 'rails_helper'

describe FriendsController, type: :controller do
  before do
    @person, @friend, @other_person = FactoryGirl.create_list(:person, 3)
    @friendship = @person.friendships.create(friend: @friend)
  end

  it 'should list all friends' 


  it 'should not show friends if user cannot see the person' 


  it 'should not show friends that the user cannot see' 


  it 'should list pending friendships' 


  it 'should not list pending friendships for anyone but the user' 


  it 'should create a friendship request' 


  it 'should accept a friendship request' 


  it 'should reject a friendship request' 


  it 'should delete a friendship' 


  it 'should reorder friends' 

end

