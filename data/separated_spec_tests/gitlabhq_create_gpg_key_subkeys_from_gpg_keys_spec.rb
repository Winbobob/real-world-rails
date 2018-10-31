require 'spec_helper'

describe Gitlab::BackgroundMigration::CreateGpgKeySubkeysFromGpgKeys, :migration, schema: 20171005130944 do
  context 'when GpgKey exists' do
    let!(:gpg_key) { create(:gpg_key, key: GpgHelpers::User3.public_key) }

    before do
      GpgKeySubkey.destroy_all
    end

    it 'generate the subkeys' 


    it 'schedules the signature update worker' 

  end

  context 'when GpgKey does not exist' do
    it 'does not do anything' 

  end
end

