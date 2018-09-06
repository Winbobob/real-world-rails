require 'rails_helper'

describe RedirectController do
  let(:group) { create(:formal_group, handle: "handle") }
  let(:discussion) { create :discussion, group: group }
  let(:poll) { create :poll, discussion: discussion }

  describe 'get group via subdomain' do
    it 'redirects to the group if the subdomain exists' 


    it 'responds with 404 if the subdomain does not exist' 

  end

  it 'get group' 


  it 'get discussion' 


  it 'get poll' 

end

