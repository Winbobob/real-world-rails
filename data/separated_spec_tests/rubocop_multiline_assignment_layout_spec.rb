# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::MultilineAssignmentLayout, :config do
  subject(:cop) { described_class.new(config) }

  let(:supported_types) { %w[if] }

  let(:cop_config) do
    {
      'EnforcedStyle' => enforced_style,
      'SupportedTypes' => supported_types
    }
  end

  context 'new_line style' do
    let(:enforced_style) { 'new_line' }

    it 'registers an offense when the rhs is on the same line' 


    it 'auto-corrects offenses' 


    it 'ignores arrays' 


    context 'configured supported types' do
      let(:supported_types) { %w[array] }

      it 'allows supported types to be configured' 

    end

    it 'allows multi-line assignments on separate lines' 


    it 'registers an offense for masgn with multi-line lhs' 

  end

  context 'same_line style' do
    let(:enforced_style) { 'same_line' }

    it 'registers an offense when the rhs is a different line' 


    it 'auto-corrects offenses' 


    it 'ignores arrays' 


    context 'configured supported types' do
      let(:supported_types) { %w[array] }

      it 'allows supported types to be configured' 

    end

    it 'allows multi-line assignments on the same line' 


    it 'registers an offense for masgn with multi-line lhs' 

  end
end

