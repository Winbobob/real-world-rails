require 'spec_helper'

describe Gitlab::BackgroundMigration::EncryptColumns, :migration, schema: 20180910115836 do
  let(:model) { Gitlab::BackgroundMigration::Models::EncryptColumns::WebHook }
  let(:web_hooks) { table(:web_hooks) }

  let(:plaintext_attrs) do
    {
      'encrypted_token' => nil,
      'encrypted_url' => nil,
      'token' =>  'secret',
      'url' => 'http://example.com?access_token=secret'
    }
  end

  let(:encrypted_attrs) do
    {
      'encrypted_token' => be_present,
      'encrypted_url' => be_present,
      'token' => nil,
      'url' => nil
    }
  end

  describe '#perform' do
    it 'encrypts columns for the specified range' 


    it 'acquires an exclusive lock for the update' 


    it 'skips already-encrypted columns' 

  end
end

