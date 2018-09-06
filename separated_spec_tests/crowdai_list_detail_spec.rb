RSpec.describe Dataset::Cell::ListDetail, type: :cell do
  describe 'cell can be instantiated' do
    let!(:article) { create :article }
    let!(:participant) { create :participant }
    subject { cell(described_class, article, current_participant: participant ) }
    it { expect( subject).to be_a Dataset::Cell::ListDetail }
  end
end

