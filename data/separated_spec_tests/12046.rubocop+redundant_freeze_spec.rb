# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RedundantFreeze do
  subject(:cop) { described_class.new }

  let(:prefix) { nil }

  shared_examples 'immutable objects' do |o|
    it "registers an offense for frozen #{o}" 


    it 'auto-corrects by removing .freeze' 

  end

  it_behaves_like 'immutable objects', '1'
  it_behaves_like 'immutable objects', '1.5'
  it_behaves_like 'immutable objects', ':sym'
  it_behaves_like 'immutable objects', ':""'

  shared_examples 'mutable objects' do |o|
    it "allows #{o} with freeze" 

  end

  it_behaves_like 'mutable objects', '[1, 2, 3]'
  it_behaves_like 'mutable objects', '{ a: 1, b: 2 }'
  it_behaves_like 'mutable objects', "'str'"
  it_behaves_like 'mutable objects', '"top#{1 + 2}"'
  it_behaves_like 'mutable objects', '/./'
  it_behaves_like 'mutable objects', '(1..5)'
  it_behaves_like 'mutable objects', '(1...5)'

  it 'allows .freeze on  method call' 


  context 'when the receiver is a frozen string literal' do
    if RuboCop::Config::KNOWN_RUBIES.include?(3.0)
      context 'when the target ruby version >= 3.0' do
        let(:ruby_version) { 3.0 }

        context 'when the frozen string literal comment is missing' do
          it_behaves_like 'immutable objects', '"#{a}"'
        end

        context 'when the frozen string literal comment is true' do
          let(:prefix) { '# frozen_string_literal: true' }

          it_behaves_like 'immutable objects', '"#{a}"'
        end

        context 'when the frozen string literal comment is false' do
          let(:prefix) { '# frozen_string_literal: false' }

          it_behaves_like 'immutable objects', '"#{a}"'
        end
      end
    end

    context 'when the target ruby version >= 2.3' do
      let(:ruby_version) { 2.3 }

      context 'when the frozen string literal comment is missing' do
        it_behaves_like 'mutable objects', '"#{a}"'
      end

      context 'when the frozen string literal comment is true' do
        let(:prefix) { '# frozen_string_literal: true' }

        it_behaves_like 'immutable objects', '"#{a}"'
      end

      context 'when the frozen string literal comment is false' do
        let(:prefix) { '# frozen_string_literal: false' }

        it_behaves_like 'mutable objects', '"#{a}"'
      end
    end
  end
end

