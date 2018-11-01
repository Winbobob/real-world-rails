require 'rails_helper'

describe EmailParams do
  let(:user) { create :user }
  let(:group) { create :formal_group }
  let(:discussion) { create :discussion }
  let(:reply_host) { 'loomio.example.org' }
  let(:to_params) { {
    host: reply_host,
    token: "d=#{discussion.id}&u=#{user.id}&k=#{user.email_api_key}"
  } }
  let(:email) { OpenStruct.new(to: [to_params], body: 'An email body') }

  before { group.add_member! user }
  subject { EmailParams.new(email, reply_host: reply_host) }

  it 'returns a hash of email values' 


  it 'does not blow up if the host is not specified correctly' 


  it 'does not blow up if the token is mangled' 


end

