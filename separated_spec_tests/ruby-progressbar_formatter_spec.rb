require 'spec_helper'
require 'support/time'
require 'ruby-progressbar/format/formatter'

class    ProgressBar
module   Format
describe Formatter do
  let(:to_the_past)           { -3_723 }
  let(:one_hundred_hours_ago) { -360_000 }
  let(:four_minutes_ago)      { -240 }
  let(:one_minute_ago)        { -60 }

  context 'the %% flag' do
    let(:format) { Format::String.new('%%') }

    it 'displays a literal percent sign' 

  end

  context 'the %a flag' do
    let(:format) { Format::String.new('%a') }

    it 'is "--:--:--" when displayed after starting the bar and then resetting the bar' 


    it 'is the time elapsed when displayed after starting the bar' 


    it 'is the total amount of time elapsed once the bar finishes' 

  end

  context 'the %b flag' do
    let(:format) { Format::String.new('%b') }

    it 'is the bar (excluding incomplete space)' 

  end

  context 'the %B flag' do
    let(:format) { Format::String.new('%B') }

    it 'is the bar (including incomplete space)' 

  end

  context 'the %c flag' do
    let(:format) { Format::String.new('%c') }

    it 'is the current capacity/progress' 

  end

  context 'the %C flag' do
    let(:format) { Format::String.new('%C') }

    it 'is the total capacity/progress' 


    it 'is nothing when the total is unknown' 

  end

  context 'the %e flag' do
    let(:format) { Format::String.new('%e') }

    it 'is unknown estimated time when called before the bar is started' 


    it 'is unknown estimated time when the bar is started with any progress' 


    it 'is "??:??:??" when called after the bar is started makes progress and reset' 


    it 'is the estimated time remaining when called after the bar is started' 


    it 'is "??:??:??" when it could take 100 hours or longer to finish' 


    it 'is the total amount of time elapsed once the bar finishes' 

  end

  context 'the %E flag' do
    let(:format) { Format::String.new('%E') }

    it 'is unknown estimated time when called before the bar is started' 


    it 'is unknown estimated time when the bar is started with any progress' 


    it 'is "??:??:??" when called after the bar is started makes progress and reset' 


    it 'is the estimated time remaining when called after the bar is started' 


    it 'is the total amount of time elapsed once the bar finishes' 


    it 'is "> 4 Days" when it could take 100 hours or longer to finish' 

  end

  context 'the %f flag' do
    let(:format) { Format::String.new('%f') }

    it 'is unknown estimated time when called before the bar is started' 


    it 'is unknown estimated time when the bar is started with any progress' 


    it 'is "??:??:??" when called after the bar is started makes progress and reset' 


    it 'is the estimated time remaining when called after the bar is started' 


    it 'is the exact estimated time when it could take 100 hours or longer to finish' 

  end

  context 'the %i flag' do
    let(:format) { Format::String.new('%i') }

    it 'is the incomplete space' 


    it 'is unknown progress when the bar total is unknown' 


    it 'is unknown progress when the bar total is unknown and has been incremented' 


    it 'is the custom unknown progress steps if those are specified' 

  end

  context 'the %j flag' do
    let(:format) { Format::String.new('%j') }

    it 'is the justified percentage complete floored to the nearest whole number' 


    it 'is zero when the total is unknown' 


    it 'is 100% when the total is zero' 

  end

  context 'the %J flag' do
    let(:format) { Format::String.new('%J') }

    it 'is the justified percentage complete floored to two decimal places' 


    it 'is zero when the total is unknown' 


    it 'is 100% when the total is zero' 

  end

  context 'the %p flag' do
    let(:format) { Format::String.new('%p') }

    it 'is the percentage complete floored to the nearest whole number' 


    it 'is zero when the total is unknown' 


    it 'is 100% when the total is zero' 

  end

  context 'the %P flag' do
    let(:format) { Format::String.new('%P') }

    it 'is the percentage complete floored to two decimal places' 


    it 'is the percentage complete only up to two decimal places' 


    it 'is zero when the total is unknown' 


    it 'is 100% when the total is zero' 

  end

  context 'the %r flag' do
    let(:format) { Format::String.new('%r') }

    it 'is the rate' 


    it 'is zero when no time has elapsed' 


    it 'is zero when no progress has been made' 


    it 'takes the starting position into account' 


    it 'is the rate when a custom rate is used' 


    it 'is zero when no progress has been made when a custom rate is used' 


    it 'takes the starting position into account when a custom rate is used' 

  end

  context 'the %R flag' do
    let(:format) { Format::String.new('%R') }

    it 'is the rate' 


    it 'is zero when no time has elapsed' 


    it 'is zero when no progress has been made' 


    it 'takes the starting position into account' 


    it 'is the rate when a custom rate is used' 


    it 'is zero when no progress has been made when a custom rate is used' 


    it 'takes the starting position into account when a custom rate is used' 

  end

  context 'the %t flag' do
    let(:format) { Format::String.new('%t') }

    it 'is the title' 

  end

  context 'the %T flag' do
    let(:format) { Format::String.new('%T') }

    it 'is the title' 

  end

  context 'the %u flag' do
    let(:format) { Format::String.new('%u') }

    it 'is "??" when the total is unknown' 

  end

  context 'the %w flag' do
    let(:format) { Format::String.new('%w') }

    it 'is the bar with the percentage' 

  end

  context 'combined flags' do
    it 'is the whole bar when combining both the bar and incomplete space flags' 


    it 'is the proper ETA when the bar has an unknown total' 


    it 'is the truncated string when the terminal width is shorter than the string ' \
       'being output and the bar length is calculated' do

      format            = Format::String.new('%t%w')
      progressbar       = ProgressBar::Base.new(:title     => ('*' * 21),
                                                :autostart => false)

      expect(Formatter.process(format, 20, progressbar)).to eql '*********************'
    end

    it 'is the truncated string when the terminal width is shorter than the string ' \
       'being output and the incomplete bar length is calculated' do

      format      = Format::String.new('%t%i')
      progressbar = ProgressBar::Base.new(:title     => ('*' * 21),
                                          :autostart => false)

      expect(Formatter.process(format, 20, progressbar)).to eql '*********************'
    end

    it 'is an empty bar when the terminal width is shorter than the string ' \
        'being output and the full bar length is calculated (but lacks the ' \
        'space to output the entire bar)' do

      format      = Format::String.new('%t%B')
      progressbar = ProgressBar::Base.new(:title     => ('*' * 19),
                                          :autostart => false)

      expect(Formatter.process(format, 20, progressbar)).to eql '******************* '
    end

    it 'is an empty bar when the terminal width is shorter than the string ' \
        'being output and the combination of bar and incomplete length is ' \
        'calculated (but lacks the space to output the entire bar)' do

      format      = Format::String.new('%t%w%i')
      progressbar = ProgressBar::Base.new(:title     => ('*' * 19),
                                          :autostart => false)

      expect(Formatter.process(format, 20, progressbar)).to eql '******************* '
    end

    it 'has the proper negative space when a bar with integrated percentage is used' 

  end

  context 'when format contains ANSI SGR codes' do
    it 'ignores their long versions when calculating bar length' 


    it 'ignores their short versions when calculating bar length' 

  end
end
end
end

