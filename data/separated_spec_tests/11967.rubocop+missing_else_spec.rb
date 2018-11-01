# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MissingElse do
  subject(:cop) { described_class.new(config) }

  context 'UnlessElse enabled' do
    let(:config) do
      RuboCop::Config.new('Style/MissingElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'both',
                            'SupportedStyles' => %w[if case both]
                          },
                          'Style/UnlessElse' => { 'Enabled' => true })
    end

    context 'given an if-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given an unless-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it "doesn't register an offense" 

      end
    end

    context 'given a case statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end
  end

  context 'UnlessElse disabled' do
    let(:config) do
      RuboCop::Config.new('Style/MissingElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'both',
                            'SupportedStyles' => %w[if case both]
                          },
                          'Style/UnlessElse' => { 'Enabled' => false })
    end

    context 'given an if-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given an unless-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given a case statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end
  end

  context 'EmptyElse enabled and set to warn on empty' do
    let(:config) do
      styles = %w[if case both]
      RuboCop::Config.new('Style/MissingElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'both',
                            'SupportedStyles' => styles
                          },
                          'Style/UnlessElse' => { 'Enabled' => false },
                          'Style/EmptyElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'empty',
                            'SupportedStyles' => %w[empty nil both]
                          })
    end

    context 'given an if-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given an unless-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given a case statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end
  end

  context 'EmptyElse enabled and set to warn on nil' do
    let(:config) do
      styles = %w[if case both]
      RuboCop::Config.new('Style/MissingElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'both',
                            'SupportedStyles' => styles
                          },
                          'Style/UnlessElse' => { 'Enabled' => false },
                          'Style/EmptyElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'nil',
                            'SupportedStyles' => %w[empty nil both]
                          })
    end

    context 'given an if-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given an unless-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given a case statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end
  end

  context 'configured to warn only on empty if' do
    let(:config) do
      styles = %w[if case both]
      RuboCop::Config.new('Style/MissingElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'if',
                            'SupportedStyles' => styles
                          },
                          'Style/UnlessElse' => { 'Enabled' => false },
                          'Style/EmptyElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'nil',
                            'SupportedStyles' => %w[empty nil both]
                          })
    end

    context 'given an if-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given an unless-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end

    context 'given a case statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it "doesn't register an offense" 

      end
    end
  end

  context 'configured to warn only on empty case' do
    let(:config) do
      styles = %w[if case both]
      RuboCop::Config.new('Style/MissingElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'case',
                            'SupportedStyles' => styles
                          },
                          'Style/UnlessElse' => { 'Enabled' => false },
                          'Style/EmptyElse' => {
                            'Enabled' => true,
                            'EnforcedStyle' => 'nil',
                            'SupportedStyles' => %w[empty nil both]
                          })
    end

    context 'given an if-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it "doesn't register an offense" 

      end
    end

    context 'given an unless-statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it "doesn't register an offense" 

      end
    end

    context 'given a case statement' do
      context 'with a completely empty else-clause' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause containing only the literal nil' do
        it "doesn't register an offense" 

      end

      context 'with an else-clause with side-effects' do
        it "doesn't register an offense" 

      end

      context 'with no else-clause' do
        it 'registers an offense' 

      end
    end
  end
end

