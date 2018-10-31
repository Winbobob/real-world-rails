require 'spec_helper'

describe 'TrimPayloadLogEntries' do
  describe 'run' do
    before do
      create(:project, id: 1)
      create(:project, id: 2)
      create(:project, id: 3)
      (0...TrimPayloadLogEntries::LOG_ENTRIES_TO_KEEP/2).each do |i|
        log = PayloadLogEntry.create(
          created_at: (TrimPayloadLogEntries::LOG_ENTRIES_TO_KEEP - i).days.ago,
          project_id: 1
        )

        @oldest_log ||= log
      end

      (0...TrimPayloadLogEntries::LOG_ENTRIES_TO_KEEP).each do |i|
        log = PayloadLogEntry.create(
          created_at: (TrimPayloadLogEntries::LOG_ENTRIES_TO_KEEP - i).days.ago,
          project_id: 2
        )

        @oldest_log2 ||= log
      end

      (0...TrimPayloadLogEntries::LOG_ENTRIES_TO_KEEP*2).each do |i|
        log = PayloadLogEntry.create(
          created_at: (TrimPayloadLogEntries::LOG_ENTRIES_TO_KEEP - i).days.ago,
          project_id: 3
        )

        @oldest_log3 ||= log
      end
    end

    it 'removes all but the last TrimPayloadLogEntries::LOG_ENTRIES_TO_KEEP logs for a given project' 

  end
end

