RSpec.describe RuboCop::Cop::RSpec::SingleArgumentMessageChain do
  subject(:cop) { described_class.new }

  describe 'receive_message_chain' do
    it 'reports single-argument calls' 


    include_examples(
      'autocorrect',
      'before { allow(foo).to receive_message_chain(:one) { :two } }',
      'before { allow(foo).to receive(:one) { :two } }'
    )

    it 'accepts multi-argument calls' 


    it 'reports single-argument string calls' 


    include_examples(
      'autocorrect',
      'before { allow(foo).to receive_message_chain("one") { :two } }',
      'before { allow(foo).to receive("one") { :two } }'
    )

    it 'accepts multi-argument string calls' 


    context 'with single-key hash argument' do
      it 'reports an offence' 


      include_examples(
        'autocorrect',
        'before { allow(foo).to receive_message_chain(bar: 42) }',
        'before { allow(foo).to receive(:bar).and_return(42) }'
      )

      include_examples(
        'autocorrect',
        'before { allow(foo).to receive_message_chain("bar" => 42) }',
        'before { allow(foo).to receive("bar").and_return(42) }'
      )

      include_examples(
        'autocorrect',
        'before { allow(foo).to receive_message_chain(:"#{foo}" => 42) }',
        'before { allow(foo).to receive(:"#{foo}").and_return(42) }'
      )
    end

    context 'with multiple keys hash argument' do
      it "doesn't report an offence" 

    end
  end

  describe 'stub_chain' do
    it 'reports single-argument calls' 


    include_examples(
      'autocorrect',
      'before { foo.stub_chain(:one) { :two } }',
      'before { foo.stub(:one) { :two } }'
    )

    it 'accepts multi-argument calls' 


    it 'reports single-argument string calls' 


    include_examples(
      'autocorrect',
      'before { foo.stub_chain("one") { :two } }',
      'before { foo.stub("one") { :two } }'
    )

    it 'accepts multi-argument string calls' 

  end
end

