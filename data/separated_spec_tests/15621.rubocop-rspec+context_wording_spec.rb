RSpec.describe RuboCop::Cop::RSpec::ContextWording, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Prefixes' => %w[when with] } }

  it 'skips describe blocks' 


  it 'finds context without `when` at the beginning' 


  it 'finds shared_context without `when` at the beginning' 


  it "skips descriptions beginning with 'when'" 


  it 'finds context without separate `when` at the beginning' 


  context 'when configured' do
    let(:cop_config) { { 'Prefixes' => %w[if] } }

    it 'finds context without whitelisted prefixes at the beginning' 


    it 'skips descriptions with whitelisted prefixes at the beginning' 

  end
end

