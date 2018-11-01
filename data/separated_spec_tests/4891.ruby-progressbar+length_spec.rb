require 'spec_helper'
require 'ruby-progressbar/calculators/length'

class     ProgressBar
module    Calculators
describe  Length do
  let(:tty_output) do
    IO.new(IO.sysopen('/dev/tty', 'w')).tap do |io|
      allow(io).to receive(:tty?).and_return true
    end
  end

  let(:non_tty_output) do
    IO.new(IO.sysopen('/dev/null', 'w')).tap do |io|
      allow(io).to receive(:tty?).and_return false
    end
  end

  context 'when the RUBY_PROGRESS_BAR_LENGTH environment variable exists' do
    before  { ENV['RUBY_PROGRESS_BAR_LENGTH'] = '44' }
    after   { ENV['RUBY_PROGRESS_BAR_LENGTH'] = nil }

    it 'calculates the length as the value of the environment variable as an integer' 

  end

  if RUBY_PLATFORM != 'java' &&
     Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('1.9.3')

    it 'can properly calculate the length even if IO.console is nil' 

  end

  it 'allows the length to be overridden on creation' 


  it 'can calculate the width of the terminal in Unix environments' 


  unless RUBY_VERSION.start_with?('1.')
    it 'asks stream for length if it is a TTY' 


    it 'asks IO.console to calculate length if the output is null' 


    it 'asks IO.console to calculate length if the output is not a TTY' 

  end

  it 'defaults to 80 if it is not a Unix environment' 


  it 'defaults to 80 if the width is less than 20' 

end
end
end

