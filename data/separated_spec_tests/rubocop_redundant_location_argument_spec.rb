# frozen_string_literal: true

RSpec.describe RuboCop::Cop::InternalAffairs::RedundantLocationArgument do
  subject(:cop) { described_class.new }

  shared_examples 'auto-correction' do |name, old_source, new_source|
    it "auto-corrects #{name}" 

  end

  context 'when location argument is passed' do
    context 'when location argument is :expression' do
      it 'registers an offense' 


      context 'when there is a message argument' do
        it 'registers an offense' 

      end

      it_behaves_like(
        'auto-correction',
        'when there is no message argument',
        'add_offense(node, location: :expression)',
        'add_offense(node)'
      )

      it_behaves_like(
        'auto-correction',
        'when there is a message argument before location',
        "add_offense(node, message: 'foo', location: :expression)",
        "add_offense(node, message: 'foo')"
      )

      it_behaves_like(
        'auto-correction',
        'when there is a message argument after location',
        "add_offense(node, location: :expression, message: 'foo')",
        "add_offense(node, message: 'foo')"
      )

      it_behaves_like(
        'auto-correction',
        'when there are arguments around location',
        <<-RUBY,
          add_offense(
            node,
            severity: :error,
            location: :expression,
            message: 'message'
          )
        RUBY
        <<-RUBY
          add_offense(
            node,
            severity: :error,
            message: 'message'
          )
        RUBY
      )
    end

    context 'when location argument does not equal to :expression' do
      it 'does not register an offense' 

    end
  end

  context 'when location argument is not passed' do
    it 'does not register an offense' 

  end
end

