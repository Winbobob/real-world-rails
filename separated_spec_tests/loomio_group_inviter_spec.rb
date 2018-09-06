require 'rails_helper'

describe GroupInviter do
  let(:group) { create :formal_group }
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:invitee) { create :user }

  before { group.add_admin! user }

  it 'invites users to a group'
  it 'creates users for emails and adds them to group'

  it 'respects invitation rate limiting' 

end

