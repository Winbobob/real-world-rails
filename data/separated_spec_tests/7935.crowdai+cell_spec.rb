RSpec.describe Image::Cell, type: :cell do
  describe 'cell can be instantiated' do
    let!(:challenge) { create :challenge }
    let!(:participant) { create :participant }
    subject { cell(described_class, challenge, current_participant: participant ) }
    it { expect( subject).to be_a Image::Cell }
  end
end

