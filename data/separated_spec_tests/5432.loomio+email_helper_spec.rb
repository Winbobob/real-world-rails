require 'rails_helper'

ENV['REPLY_HOSTNAME'] = 'replyhostname.com'

describe EmailHelper do
  context 'reply_to_address' do
    let(:discussion) { create(:discussion) }
    let(:comment) { create(:comment, discussion: discussion) }
    let(:user) { create(:user, email_api_key: 'abc123') }
    it "gives correct format" 


    it "gives correct format for a comment" 

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

