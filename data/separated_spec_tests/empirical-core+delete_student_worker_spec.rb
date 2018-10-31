require 'rails_helper'

describe DeleteStudentWorker do
  let(:subject) { described_class.new }
  let(:analyzer) { double(:analyzer, track: true) }

  before do
    allow(Analyzer).to receive(:new) { analyzer }
  end

  describe '#perform' do
    let!(:teacher) { create(:teacher) }

    context 'if referred from class path' do
      it 'should track the delete student account' 

    end

    context 'if not referred from class path' do
      it 'should track the mystery delete student' 

    end
  end
end

