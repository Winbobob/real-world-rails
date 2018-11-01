# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MutableConstant do
  subject(:cop) { described_class.new }

  let(:prefix) { nil }

  shared_examples 'mutable objects' do |o|
    context 'when assigning with =' do
      it "registers an offense for #{o} assigned to a constant" 


      it 'auto-corrects by adding .freeze' 

    end

    context 'when assigning with ||=' do
      it "registers an offense for #{o} assigned to a constant" 


      it 'auto-corrects by adding .freeze' 

    end
  end

  it_behaves_like 'mutable objects', '[1, 2, 3]'
  it_behaves_like 'mutable objects', '{ a: 1, b: 2 }'
  it_behaves_like 'mutable objects', "'str'"
  it_behaves_like 'mutable objects', '"top#{1 + 2}"'

  shared_examples 'immutable objects' do |o|
    it "allows #{o} to be assigned to a constant" 


    it "allows #{o} to be ||= to a constant" 

  end

  it_behaves_like 'immutable objects', '1'
  it_behaves_like 'immutable objects', '1.5'
  it_behaves_like 'immutable objects', ':sym'

  it 'allows method call assignments' 


  context 'when performing a splat assignment' do
    it 'allows an immutable value' 


    it 'allows a frozen array value' 


    it 'registers an offense for a mutable value' 

  end

  context 'when assigning an array without brackets' do
    it 'adds brackets when auto-correcting' 


    it 'does not add brackets to %w() arrays' 

  end

  context 'when assigning a range (irange) without parenthesis' do
    it 'adds parenthesis when auto-correcting' 


    it 'does not add parenthesis to range enclosed in parentheses' 

  end

  context 'when assigning a range (erange) without parenthesis' do
    it 'adds parenthesis when auto-correcting' 


    it 'does not add parenthesis to range enclosed in parentheses' 

  end

  context 'when the constant is a frozen string literal' do
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

