require 'spec_helper'

describe Gitlab::Auth::RequestAuthenticator do
  let(:env) do
    {
      'rack.input' => '',
      'REQUEST_METHOD' => 'GET'
    }
  end
  let(:request) { ActionDispatch::Request.new(env) }

  subject { described_class.new(request) }

  describe '#user' do
    let!(:sessionless_user) { build(:user) }
    let!(:session_user) { build(:user) }

    it 'returns sessionless user first' 


    it 'returns session user if no sessionless user found' 


    it 'returns nil if no user found' 


    it 'bubbles up exceptions' 

  end

  describe '#find_sessionless_user' do
    let!(:access_token_user) { build(:user) }
    let!(:feed_token_user) { build(:user) }

    it 'returns access_token user first' 


    it 'returns feed_token user if no access_token user found' 


    it 'returns nil if no user found' 


    it 'rescue Gitlab::Auth::AuthenticationError exceptions' 

  end
end

