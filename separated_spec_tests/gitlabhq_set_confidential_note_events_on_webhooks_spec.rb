require 'spec_helper'

describe Gitlab::BackgroundMigration::SetConfidentialNoteEventsOnWebhooks, :migration, schema: 20180104131052 do
  let(:web_hooks) { table(:web_hooks) }

  describe '#perform' do
    it 'migrates hooks where note_events is true' 


    it 'ignores hooks where note_events is false' 


    it 'ignores hooks where confidential_note_events has already been set' 

  end
end

