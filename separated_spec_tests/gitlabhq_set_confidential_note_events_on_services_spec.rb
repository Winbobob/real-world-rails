require 'spec_helper'

describe Gitlab::BackgroundMigration::SetConfidentialNoteEventsOnServices, :migration, schema: 20180122154930 do
  let(:services) { table(:services) }

  describe '#perform' do
    it 'migrates services where note_events is true' 


    it 'ignores services where note_events is false' 


    it 'ignores services where confidential_note_events has already been set' 

  end
end

