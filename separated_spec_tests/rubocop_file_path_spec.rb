# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::FilePath do
  subject(:cop) { described_class.new }

  context 'when using Rails.root.join with some path strings' do
    it 'does not registers an offense' 

  end

  context 'when using Rails.root.join in string interpolation of argument' do
    it 'does not registers an offense' 

  end

  context 'when using string interpolation without Rails.root' do
    it 'does not registers an offense' 

  end

  context 'when using File::SEPARATOR string without Rails.root' do
    it 'does not registers an offense' 

  end

  context 'when using File.join with Rails.root' do
    it 'registers an offense' 

  end

  context 'when using Rails.root.join with slash separated path string' do
    it 'registers an offense' 

  end

  context 'when using Rails.root called by double quoted string' do
    it 'registers an offense' 

  end

  context 'when concat Rails.root and file separator ' \
          'using string interpolation' do
    it 'registers an offense' 

  end

  context 'when concat Rails.root.join and extension ' \
          'using string interpolation' do
    it 'registers an offense' 

  end

  context 'Rails.root is used as a method argument' do
    it 'registers an offense once' 

  end

  context 'Rails.root.join used as an argument' do
    it 'registers an offense once' 

  end

  context 'Rails.root.join with a non-string argument including "/"' do
    it 'does not register an offense' 

  end

  context 'when string contains an interpolation followed by a period' do
    it 'does not register an offense' 

  end
end

