# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::IdenticalConditionalBranches do
  subject(:cop) { described_class.new }

  context 'on if..else with identical bodies' do
    it 'registers an offense' 

  end

  context 'on if..else with identical trailing lines' do
    it 'registers an offense' 

  end

  context 'on if..else with identical leading lines' do
    it 'registers an offense' 

  end

  context 'on if..elsif with no else' do
    it "doesn't register an offense" 

  end

  context 'on if..else with slightly different trailing lines' do
    it "doesn't register an offense" 

  end

  context 'on case with identical bodies' do
    it 'registers an offense' 

  end

  # Regression: https://github.com/bbatsov/rubocop/issues/3868
  context 'when one of the case branches is empty' do
    it 'does not register an offense' 

  end

  context 'on case with identical trailing lines' do
    it 'registers an offense' 

  end

  context 'on case with identical leading lines' do
    it 'registers an offense' 

  end

  context 'on case without else' do
    let(:source) do
      <<-RUBY.strip_indent
        case something
        when :a
          do_x
        when :b
          do_x
        end
      RUBY
    end

    it "doesn't register an offense" 

  end

  context 'on case with empty when' do
    it "doesn't register an offense" 

  end
end

