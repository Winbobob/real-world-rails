require 'spec_helper'
require 'support/time'
require 'stringio'

class    ProgressBar
describe Base do
  let(:output) do
    StringIO.new('', 'w+').tap do |io|
      allow(io).to receive(:tty?).and_return true
    end
  end

  let(:output_string) do
    output.rewind
    output.read
  end

  let(:non_tty_output) do
    StringIO.new('', 'w+').tap do |io|
      allow(io).to receive(:tty?).and_return false
    end
  end

  let(:non_tty_output_string) do
    non_tty_output.rewind
    non_tty_output.read
  end

  context 'the title' do
    it 'has a default' 


    it 'is able to be overridden on creation' 


    it 'allows title updates even after the bar is started' 


    it 'ignores title changes for a non-TTY enabled devices' 


    it 'allows for custom title for a non-TTY enabled devices on creation' 

  end

  context 'the progress_mark' do
    it 'can be changed even after the bar is started' 

  end

  context 'the remainder_mark' do
    it 'can be changed even after the bar is started' 

  end

  context 'the output stream' do
    it 'has a default' 


    it 'is able to be overridden on creation' 

  end

  context 'the bar length' do
    it 'is able to be overridden on creation' 


    it 'can handle the terminal width changing on the fly' 

  end

  context 'starting the bar' do
    it 'clears the current terminal line' 


    it 'prints the bar for the first time' 


    it 'prints correctly when a position to start at is specified' 


    it 'does not blow up if there is a total of zero' 

  end

  context 'stopping the bar' do
    it 'forcibly halts the bar wherever it is and cancels further progress' 


    it 'forcibly halts the bar wherever it is for a non-TTY enabled devices' 


    it 'does not output multiple bars if stopped multiple times in a row' 


    it 'does not error if there is nothing to do and it has not been started' 


    it 'appends proper ending to string for non-TTY devices' 

  end

  context 'finishing the bar' do
    it 'does not spam the screen for a non-TTY enabled devices' 


    it 'can finish a bar in the middle of progress for a non-TTY enabled devices' 


    it 'properly prints a newline when incremented to its total' 


    it 'does not spam the screen if the bar is autofinished and finish is called' 


    it 'does not autofinish if autofinish is disabled' 


    it 'does not print a newline if incremented to total and autofinish is disabled' 


    it 'still allows the bar to be reset if autofinish is disabled' 


    it 'still able to be manually finished even if autofinish is disabled' 


    it 'does not spam the screen on multiple manual calls when autofinish is disabled' 

  end

  context 'resetting the bar' do
    it 'sets the bar back to the starting value' 


    it 'sets the bar back to its starting value set during creation' 

  end

  context 'logging messages' do
    it 'it can log messages for a TTY enabled device' 


    it 'it can log messages for a non-TTY enabled device' 

  end

  context 'formatting the bar' do
    it 'allows the bar format to be updated dynamically after it is started' 


    it 'allows the bar to be reset back to the default format' 

  end

  context 'clearing the bar' do
    it 'clears the current terminal line and/or bar text' 

  end

  context 'incrementing the bar' do
    it 'displays the bar with the correct progress' 

  end

  context 'decrementing the bar' do
    it 'displays the bar with the correct progress' 


    context 'for non-TTY enabled devices' do
      it 'does nothing' 

    end
  end

  it 'can be converted into a hash' 

end
end

