# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::InverseOf do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  context 'with scope' do
    it 'registers an offense when not specifying `:inverse_of`' 


    it 'does not register an offense when specifying `inverse_of: false`' 


    it 'registers an offense when specifying `inverse_of: nil`' 

  end

  context 'with option preventing automatic inverse' do
    it 'registers an offense when not specifying `:inverse_of`' 


    it 'does not register an offense when specifying `:inverse_of`' 


    it 'does not register an offense with `:inverse_of` as first option' 


    it 'registers an offense with other option and `:inverse_of` unset' 


    it 'registers an offense when including `conditions` option' 

  end

  context 'with scope and options' do
    it 'registers an offense when not specifying `:inverse_of`' 


    it 'does not register an offense when specifying `:inverse_of`' 

  end

  context '`:as` option' do
    context 'Rails < 5.2', :rails5 do
      it 'registers an offense when not specifying `:inverse_of`' 

    end

    context 'Rails >= 5.2', :config do
      let(:rails_version) { 5.2 }

      it 'does not register an offense when not specifying `:inverse_of`' 

    end
  end

  context 'with no options' do
    it 'does not register an offense' 

  end

  context 'with other options' do
    it 'does not register an offense' 

  end

  context 'with option ignoring `:inverse_of`' do
    it 'does not register an offense when including `through` option' 


    it 'does not register an offense when including `polymorphic` option' 

  end

  context 'with valid options in `with_options`' do
    it 'does not register an offense' 


    it 'does not register an offense when using the explicit receiver' 


    it 'registers an offense when using the invalid explicit receiver' 


    it 'does not register an offense when using multiple blocks' 

  end

  context 'with invalid options in `with_options`' do
    it 'registers an offense' 


    it 'registers an offense when using the explicit receiver' 


    it 'registers an offense when using multiple blocks' 

  end
end

