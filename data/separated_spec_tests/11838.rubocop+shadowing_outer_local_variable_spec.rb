# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::ShadowingOuterLocalVariable do
  subject(:cop) { described_class.new }

  context 'when a block argument has same name ' \
          'as an outer scope variable' do
    it 'registers an offense' 

  end

  context 'when a splat block argument has same name ' \
          'as an outer scope variable' do
    it 'registers an offense' 

  end

  context 'when a block block argument has same name ' \
          'as an outer scope variable' do
    it 'registers an offense' 

  end

  context 'when a block local variable has same name ' \
          'as an outer scope variable' do
    it 'registers an offense' 

  end

  context 'when a block argument has different name ' \
          'with outer scope variables' do
    it 'does not register an offense' 

  end

  context 'when an outer scope variable is reassigned in a block' do
    it 'does not register an offense' 

  end

  context 'when an outer scope variable is referenced in a block' do
    it 'does not register an offense' 

  end

  context 'when multiple block arguments have same name "_"' do
    it 'does not register an offense' 

  end

  context 'when multiple block arguments have ' \
          'a same name starts with "_"' do
    it 'does not register an offense' 

  end

  context 'when a block argument has same name "_" ' \
          'as outer scope variable "_"' do
    it 'does not register an offense' 

  end

  context 'when a block argument has a same name starts with "_" ' \
          'as an outer scope variable' do
    it 'does not register an offense' 

  end

  context 'when a method argument has same name ' \
          'as an outer scope variable' do
    it 'does not register an offense' 

  end
end

