# frozen_string_literal: true

require 'rails_helper'

describe RegisterQueuedFileJob do
  let(:work) { build(:work, id: '1234') }

  context 'without existing queued files' do
    it 'adds a record' 

  end

  context 'with an existing queued file' do
    before { QueuedFile.create(work_id: work.id) }
    it 'does not add a record' 

  end
end

