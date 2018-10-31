# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UselessElseWithoutRescue do
  subject(:cop) { described_class.new }

  context 'with `else` without `rescue`' do
    it 'registers an offense' 

  end

  context 'with `else` with `rescue`' do
    it 'accepts' 

  end
end

