require 'rails_helper'

RSpec.describe AdminFlashHelper do
  describe '#disabled_flash_ids_from_cookies' do
    let(:cookies) {
      {
        'admin_flash_10' => 'disabled',
        'admin_flash_20' => 'disabled',
        'not_a_flash_15' => 'disabled',
        'admin_flash_' => 'disabled'
      }
    }

    it 'returns the disabled flash ids' 

  end
end

