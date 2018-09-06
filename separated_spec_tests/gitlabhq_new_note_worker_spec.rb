require "spec_helper"

describe NewNoteWorker do
  context 'when Note found' do
    let(:note) { create(:note) }

    it "calls NotificationService#new_note" 


    it "calls Notes::PostProcessService#execute" 

  end

  context 'when Note not found' do
    let(:unexistent_note_id) { 999 }

    it 'logs NewNoteWorker process skipping' 


    it 'does not raise errors' 


    it "does not call NotificationService#new_note" 


    it "does not call Notes::PostProcessService#execute" 

  end
end

