RSpec.describe RuboCop::Cop::RSpec::ExampleLength, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Max' => 3 } }

  it 'ignores non-spec blocks' 


  it 'allows an empty example' 


  it 'allows a short example' 


  it 'ignores comments' 


  context 'when inspecting large examples' do
    it 'flags the example' 

  end

  context 'with CountComments enabled' do
    let(:cop_config) do
      { 'Max' => 3, 'CountComments' => true }
    end

    it 'flags the example' 

  end
end

