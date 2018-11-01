require 'spec_helper'

describe Events::RenderService do
  describe '#execute' do
    let!(:note) { build(:note) }
    let!(:event) { build(:event, target: note, project: note.project) }
    let!(:user) { build(:user) }

    context 'when the request format is atom' do
      it 'renders the note inside events' 

    end

    context 'when the request format is not atom' do
      it 'renders the note inside events' 

    end
  end
end

