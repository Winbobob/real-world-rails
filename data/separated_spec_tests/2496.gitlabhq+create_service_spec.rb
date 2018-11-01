require 'spec_helper'

describe GpgKeys::CreateService do
  let(:user) { create(:user) }
  let(:params) { attributes_for(:gpg_key) }

  subject { described_class.new(user, params) }

  context 'notification', :mailer do
    it 'sends a notification' 

  end

  it 'creates a gpg key' 


  context 'when the public key contains subkeys' do
    let(:params) { attributes_for(:gpg_key_with_subkeys) }

    it 'generates the gpg subkeys' 

  end
end

