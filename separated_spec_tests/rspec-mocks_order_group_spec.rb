RSpec.describe 'OrderGroup' do
  let(:order_group) { ::RSpec::Mocks::OrderGroup.new }

  describe '#consume' do
    let(:ordered_1) { double :ordered? => true }
    let(:ordered_2) { double :ordered? => true }
    let(:unordered) { double :ordered? => false }

    before do
      order_group.register unordered
      order_group.register ordered_1
      order_group.register unordered
      order_group.register ordered_2
      order_group.register unordered
      order_group.register unordered
    end

    it 'returns the first ordered? expectation' 

    it 'keeps returning ordered? expectation until all are returned' 

  end
end

