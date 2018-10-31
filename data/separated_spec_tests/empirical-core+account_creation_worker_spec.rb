require 'rails_helper'

describe AccountCreationWorker do
  let(:subject) { described_class.new }
  let(:analyzer) { double(:analyzer, track_chain: true, track_with_attributes: true) }

  before do
    allow(Analyzer).to receive(:new) { analyzer }
  end

  describe '#perform' do
    context 'when user is a student' do
      let!(:student) { create(:student) }

      it 'should track student account creation' 

    end

    context 'when user is a teacher' do
      context 'when send newsletter is false' do
        let!(:teacher) { create(:teacher, send_newsletter: false) }

        it 'should track the account creation' 

      end

      context 'when send newsletter' do
        let!(:teacher) { create(:teacher, send_newsletter: true) }

        it 'should track the creation and sign up for newsletter' 

      end
    end
  end
end

