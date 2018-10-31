require 'rails_helper'

describe Gitlab::Gpg do
  describe '.fingerprints_from_key' do
    before do
      # make sure that each method is using the temporary keychain
      expect(described_class).to receive(:using_tmp_keychain).and_call_original
    end

    it 'returns CurrentKeyChain.fingerprints_from_key' 

  end

  describe '.primary_keyids_from_key' do
    it 'returns the keyid' 


    it 'returns an empty array when the key is invalid' 

  end

  describe '.subkeys_from_key' do
    it 'returns the subkeys by primary key' 


    it 'returns an empty array when there are not subkeys' 

  end

  describe '.user_infos_from_key' do
    it 'returns the names and emails' 


    it 'returns an empty array when the key is invalid' 


    it 'downcases the email' 


    it 'rejects non UTF-8 names and addresses' 

  end

  describe '.current_home_dir' do
    let(:default_home_dir) { GPGME::Engine.dirinfo('homedir') }

    it 'returns the default value when no explicit home dir has been set' 


    it 'returns the explicitely set home dir' 


    it 'returns the default value when explicitely setting the home dir to nil' 

  end

  describe '.using_tmp_keychain' do
    it "the second thread does not change the first thread's directory" 


    it 'allows recursive execution in the same thread' 

  end
end

describe Gitlab::Gpg::CurrentKeyChain do
  around do |example|
    Gitlab::Gpg.using_tmp_keychain do
      example.run
    end
  end

  describe '.add' do
    it 'stores the key in the keychain' 

  end

  describe '.fingerprints_from_key' do
    it 'returns the fingerprint' 


    it 'returns an empty array when the key is invalid' 

  end
end

