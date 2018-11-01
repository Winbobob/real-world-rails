# frozen_string_literal: true

require 'rails_helper'

describe CurationConcerns::LockManager do
  subject { described_class.new(CurationConcerns.config.lock_time_to_live,
                                CurationConcerns.config.lock_retry_count,
                                CurationConcerns.config.lock_retry_delay) }

  describe 'lock', unless: travis? do
    it 'calls the block' 

  end
end

