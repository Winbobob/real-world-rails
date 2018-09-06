require 'spec_helper'

RSpec.describe 'AwesomePrint' do
  def stub_tty!(output = true, stream = STDOUT)
    if output
      stream.instance_eval { def tty?;  true; end }
    else
      stream.instance_eval { def tty?; false; end }
    end
  end

  describe 'colorization' do
    PLAIN = '[ 1, :two, "three", [ nil, [ true, false ] ] ]'
    COLORIZED = "[ \e[1;34m1\e[0m, \e[0;36m:two\e[0m, \e[0;33m\"three\"\e[0m, [ \e[1;31mnil\e[0m, [ \e[1;32mtrue\e[0m, \e[1;31mfalse\e[0m ] ] ]"

    before do
      ENV['TERM'] = 'xterm-colors'
      ENV.delete('ANSICON')
      @arr = [1, :two, 'three', [nil, [true, false]]]
    end

    describe 'default settings (no forced colors)' do
      before do
        AwesomePrint.force_colors! false
      end

      it 'colorizes tty processes by default' 


      it "colorizes processes with ENV['ANSICON'] by default" 


      it 'does not colorize tty processes running in dumb terminals by default' 


      it 'does not colorize subprocesses by default' 

    end

    describe 'forced colors override' do
      before do
        AwesomePrint.force_colors!
      end

      it 'still colorizes tty processes' 


      it "colorizes processes with ENV['ANSICON'] set to 0" 


      it 'colorizes dumb terminals' 


      it 'colorizes subprocess' 

    end
  end
end

