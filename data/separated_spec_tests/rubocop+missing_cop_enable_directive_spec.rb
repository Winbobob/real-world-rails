# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::MissingCopEnableDirective, :config do
  subject(:cop) { described_class.new(config) }

  context 'when the maximum range size is infinite' do
    let(:cop_config) { { 'MaximumRangeSize' => Float::INFINITY } }

    it 'registers an offense when a cop is disabled and never re-enabled' 


    it 'does not register an offense when the disable cop is re-enabled' 

  end

  context 'when the maximum range size is finite' do
    let(:cop_config) { { 'MaximumRangeSize' => 2 } }

    it 'registers an offense when a cop is disabled for too many lines' 


    it 'registers an offense when a cop is disabled and never re-enabled' 


    it 'does not register an offense when the disable cop is re-enabled ' \
       'within the limit' do
      expect_no_offenses(<<-RUBY.strip_indent)
        # rubocop:disable Layout/SpaceAroundOperators
        x =   0
        y = 1
        # rubocop:enable Layout/SpaceAroundOperators
        # Some other code
      RUBY
    end
  end
end

