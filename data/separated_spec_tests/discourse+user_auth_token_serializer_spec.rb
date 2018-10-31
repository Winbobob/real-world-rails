require 'rails_helper'

describe UserAuthTokenSerializer do

  let(:user) { Fabricate(:moderator) }
  let(:token) { UserAuthToken.generate!(user_id: user.id, client_ip: '2a02:ea00::', staff: true) }

  before(:each) do
    DiscourseIpInfo.open_db(File.join(Rails.root, 'spec', 'fixtures', 'mmdb'))
  end

  it 'serializes user auth tokens with respect to user locale' 


  it 'correctly translates Discourse locale to MaxMindDb locale' 

end

