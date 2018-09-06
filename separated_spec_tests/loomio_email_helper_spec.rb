require 'rails_helper'

ENV['REPLY_HOSTNAME'] = 'replyhostname.com'

describe EmailHelper do
  context 'reply_to_address' do
    let(:discussion) { double(:discussion, id: 'd1') }
    let(:user) { double(:user, id: '1', email_api_key: 'abc123') }
    it "gives correct format" 

  end

  describe 'polymorphic_url' do
    let(:group) { create :formal_group }
    let(:discussion) { create :discussion }
    let(:comment) { create :comment }
    let(:utm_hash) { { utm_medium: "wark" }}

    it 'returns a discussion url' 


    it 'returns a group url' 


    it 'returns a comment url' 


    it 'can accept a utm hash' 

  end
end

