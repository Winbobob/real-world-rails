describe FactoryBot::Attribute::Sequence do
  let(:sequence_name) { :name }
  let(:name)          { :first_name }
  let(:sequence)      { FactoryBot::Sequence.new(sequence_name, 5) { |n| "Name #{n}" } }

  subject { FactoryBot::Attribute::Sequence.new(name, sequence_name, false) }
  before  { FactoryBot.register_sequence(sequence) }

  its(:name) { should eq name }

  it "assigns the next value in the sequence" 

end

