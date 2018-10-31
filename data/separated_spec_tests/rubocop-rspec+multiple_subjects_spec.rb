# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::MultipleSubjects do
  let(:cop) { described_class.new }

  it 'registers an offense for every overwritten subject' 


  it 'does not try to autocorrect subject!' 


  it 'does not flag shared example groups' 


  include_examples(
    'autocorrect',
    <<-RUBY,
      describe 'hello there' do
        subject(:foo) { 1 }
        subject(:bar) { 2 }
        subject(:baz) { 3 }

        describe 'baz' do
          subject(:norf) { 1 }
        end
      end
    RUBY
    <<-RUBY
      describe 'hello there' do
        let(:foo) { 1 }
        let(:bar) { 2 }
        subject(:baz) { 3 }

        describe 'baz' do
          subject(:norf) { 1 }
        end
      end
    RUBY
  )

  include_examples(
    'autocorrect',
    <<-RUBY.strip_indent.chomp,
      describe 'hello there' do
        subject { 1 }
        subject { 2 }
        subject { 3 }
      end
    RUBY
    [
      "describe 'hello there' do",
      '  ',
      '  ',
      '  subject { 3 }',
      'end'
    ].join("\n")
  )
end

