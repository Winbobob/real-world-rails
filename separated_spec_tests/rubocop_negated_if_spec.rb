# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::NegatedIf do
  subject(:cop) do
    config = RuboCop::Config.new(
      'Style/NegatedIf' => {
        'SupportedStyles' => %w[both prefix postfix],
        'EnforcedStyle' => 'both'
      }
    )
    described_class.new(config)
  end

  describe 'with “both” style' do
    it 'registers an offense for if with exclamation point condition' 


    it 'registers an offense for unless with exclamation point condition' 


    it 'registers an offense for if with "not" condition' 


    it 'accepts an if/else with negative condition' 


    it 'accepts an if where only part of the condition is negated' 


    it 'accepts an if where the condition is doubly negated' 


    it 'is not confused by negated elsif' 


    it 'autocorrects for postfix' 


    it 'autocorrects by replacing if not with unless' 


    it 'autocorrects by replacing parenthesized if not with unless' 


    it 'autocorrects by replacing unless not with if' 


    it 'autocorrects for prefix' 

  end

  describe 'with “prefix” style' do
    subject(:cop) do
      config = RuboCop::Config.new(
        'Style/NegatedIf' => {
          'SupportedStyles' => %w[both prefix postfix],
          'EnforcedStyle' => 'prefix'
        }
      )

      described_class.new(config)
    end

    it 'registers an offence for prefix' 


    it 'does not register an offence for postfix' 


    it 'autocorrects for prefix' 

  end

  describe 'with “postfix” style' do
    subject(:cop) do
      config = RuboCop::Config.new(
        'Style/NegatedIf' => {
          'SupportedStyles' => %w[both prefix postfix],
          'EnforcedStyle' => 'postfix'
        }
      )

      described_class.new(config)
    end

    it 'registers an offence for postfix' 


    it 'does not register an offence for prefix' 


    it 'autocorrects for postfix' 

  end

  it 'does not blow up for ternary ops' 


  it 'does not blow up on a negated ternary operator' 


  it 'does not blow up for empty if condition' 


  it 'does not blow up for empty unless condition' 

end

