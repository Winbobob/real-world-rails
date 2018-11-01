require 'rails_helper'

describe MessagesController, type: :controller do
  render_views

  before do
    @person, @other_person = FactoryGirl.create_list(:person, 2)
    @group = Group.create! name: 'Some Group', category: 'test'
    @group.memberships.create! person: @person
    (@peers = FactoryGirl.create_list(:person, 3)).each do |peer|
      @group.memberships.create! person: peer
    end
  end

  it 'should delete a group message' 


  it 'should create new private messages' 


  it 'should render preview of private message' 


  it 'should create new group messages' 


  it 'should render preview of group message' 


  it 'should not allow someone to post to a group they do not belong to unless they are an admin' 


  it 'should create new group messages with an attachment' 


  it 'should create new private messages with an attachment' 


  it 'should not allow parent_id on message user cannot see' 


  it 'should show a message' 


  it 'should show a message with an attachment' 


  it 'should send message to members of group that are selected' 

end

