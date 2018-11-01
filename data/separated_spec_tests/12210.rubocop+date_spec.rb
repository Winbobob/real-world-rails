# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::Date, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is "strict"' do
    let(:cop_config) { { 'EnforcedStyle' => 'strict' } }

    %w[today current yesterday tomorrow].each do |day|
      it "registers an offense for Date.#{day}" 


      it "registers an offense for ::Date.#{day}" 


      it "accepts Some::Date.#{day}" 

    end

    %w[to_time to_time_in_current_zone].each do |method|
      it "registers an offense for ##{method}" 


      it "accepts variable named #{method}" 


      it "accepts variable #{method} as range end" 

    end

    context 'when a zone is provided' do
      it 'does not register an offense' 

    end

    context 'when a string literal with timezone' do
      it 'does not register an offense' 

    end

    context 'when a string literal without timezone' do
      it 'registers an offense' 

    end

    context 'when a string literal with "Z"-style UTC timezone' do
      it 'does not register an offense' 

    end

    it 'does not blow up in the presence of a single constant to inspect' 


    RuboCop::Cop::Rails::TimeZone::ACCEPTED_METHODS.each do |a_method|
      it "registers an offense for val.to_time.#{a_method}" 

    end
  end

  context 'when EnforcedStyle is "flexible"' do
    let(:cop_config) { { 'EnforcedStyle' => 'flexible' } }

    %w[current yesterday tomorrow].each do |day|
      it "accepts Date.#{day}" 

    end

    it 'registers an offense for Date.today' 


    RuboCop::Cop::Rails::TimeZone::ACCEPTED_METHODS.each do |a_method|
      it "accepts val.to_time.#{a_method}" 

    end

    it 'accepts #to_time_in_current_zone' 

  end
end

