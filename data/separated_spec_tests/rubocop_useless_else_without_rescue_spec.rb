# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UselessElseWithoutRescue do
  subject(:cop) { described_class.new }

  before do
    inspect_source(source)
  end

  context 'with `else` without `rescue`' do
    let(:source) do
      <<-RUBY.strip_indent
        begin
          do_something
        else
          handle_unknown_errors
        end
      RUBY
    end

    it 'registers an offense' 

  end

  context 'with `else` with `rescue`' do
    let(:source) do
      <<-RUBY.strip_indent
        begin
          do_something
        rescue ArgumentError
          handle_argument_error
        else
          handle_unknown_errors
        end
      RUBY
    end

    it 'accepts' 

  end
end

