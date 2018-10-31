require 'rails_helper'

describe AuthHash do

  describe '#user_info' do
    it "it extracts the user's information" 

  end

end

def user_hash
  { 'provider'    => 'github',
    'uid'         => 'uid',
    'info'        => { 'nickname' => 'jane-doe' },
    'credentials' => { 'token' => 'some-token' } }
end

