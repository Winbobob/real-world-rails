# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::TimeZone, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is "strict"' do
    let(:cop_config) { { 'EnforcedStyle' => 'strict' } }

    described_class::TIMECLASS.each do |klass|
      it "registers an offense for #{klass}.now" 


      it "registers an offense for #{klass}.current" 


      it "registers an offense for #{klass}.new without argument" 


      it "registers an offense for #{klass}.new with argument" 


      it 'does not register an offense when a .new method is made
        independently of the Time class' do
        inspect_source('Range.new(1,
                                  Time.days_in_month(date.month, date.year))')
        expect(cop.offenses.empty?).to be(true)
      end

      it "does not register an offense for #{klass}.new with zone argument" 


      it "registers an offense for ::#{klass}.now" 


      it "accepts Some::#{klass}.now" 


      described_class::ACCEPTED_METHODS.each do |a_method|
        it "registers an offense #{klass}.now.#{a_method}" 

      end
    end

    it 'registers an offense for Time.parse' 


    it 'registers an offense for Time.at' 


    it 'registers an offense for Time.at.in_time_zone' 


    it 'registers an offense for Time.parse.localtime(offset)' 


    it 'registers an offense for Time.parse.localtime' 


    it 'registers an offense for Time.parse in return' 


    it 'accepts Time.zone.now' 


    it 'accepts Time.zone.today' 


    it 'accepts Time.zone.local' 


    it 'accepts Time.zone.parse' 


    it 'accepts Time.zone.at' 


    it 'accepts Time.zone.parse.localtime' 


    it 'accepts Time.zone.parse.localtime(offset)' 


    it 'accepts Time.zone_default.now' 


    it 'accepts Time.zone_default.today' 


    it 'accepts Time.zone_default.local' 


    it 'accepts Time.find_zone(time_zone).now' 


    it 'accepts Time.find_zone(time_zone).today' 


    it 'accepts Time.find_zone(time_zone).local' 


    it 'accepts Time.find_zone!(time_zone).now' 


    it 'accepts Time.find_zone!(time_zone).today' 


    it 'accepts Time.find_zone!(time_zone).local' 


    described_class::DANGEROUS_METHODS.each do |a_method|
      it "accepts Some::Time.#{a_method}" 

    end
  end

  context 'when EnforcedStyle is "flexible"' do
    let(:cop_config) { { 'EnforcedStyle' => 'flexible' } }

    described_class::TIMECLASS.each do |klass|
      it "registers an offense for #{klass}.now" 


      it "accepts #{klass}.current" 


      described_class::ACCEPTED_METHODS.each do |a_method|
        it "accepts #{klass}.now.#{a_method}" 

      end

      it "accepts #{klass}.zone.now" 


      it "accepts #{klass}.zone_default.now" 


      it "accepts #{klass}.find_zone(time_zone).now" 


      it "accepts #{klass}.find_zone!(time_zone).now" 


      described_class::DANGEROUS_METHODS.each do |a_method|
        it "accepts #{klass}.current.#{a_method}" 

      end
    end

    it 'accepts Time.parse.localtime(offset)' 


    it 'does not blow up in the presence of a single constant to inspect' 

  end
end

