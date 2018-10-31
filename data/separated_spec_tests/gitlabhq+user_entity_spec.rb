require 'spec_helper'

describe UserEntity do
  include Gitlab::Routing

  let(:entity) { described_class.new(user) }
  let(:user) { create(:user) }
  subject { entity.as_json }

  it 'exposes user name and login' 


  it 'does not expose passwords' 


  it 'does not expose tokens' 


  it 'does not expose 2FA OTPs' 


  it 'exposes user path' 

end

