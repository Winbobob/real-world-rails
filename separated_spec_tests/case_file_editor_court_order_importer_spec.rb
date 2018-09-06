RSpec.describe CourtOrderImporter do
  let(:source) {
    {
      'court_order_title' => 'confiscation_order',
      'reason_for_request' => 'These are the reasons for request 2',
      'draft_conditions' => ['Condition 1', 'Condition 2']
    }
  }

  context 'imported object' do
    subject {
      described_class.new(source).import
    }

    it 'is a CourtOrder' 


    it 'has a title' 

  end
end

