require 'spec_helper'

RSpec.describe 'AwesomePrint' do

  describe 'Misc' do
    it 'handle weird objects that return nil on inspect' 


    it 'handle frozen object.inspect' 


    # See https://github.com/awesome-print/awesome_print/issues/35
    it 'handle array grep when pattern contains / chapacter' 


    # See https://github.com/awesome-print/awesome_print/issues/85
    if RUBY_VERSION >= '1.8.7'
      it "handle array grep when a method is defined in C and thus doesn't have a binding" 

    end

    it 'returns value passed as a parameter' 


    # Require different file name this time (lib/ap.rb vs. lib/awesome_print).
    it "several require 'awesome_print' should do no harm" 


    it 'format ENV as hash' 


    # See https://github.com/awesome-print/awesome_print/issues/134
    it 'IPAddr workaround' 


    # See https://github.com/awesome-print/awesome_print/issues/139
    it 'Object that overrides == and expects the :id method' 

  end

  #------------------------------------------------------------------------------
  describe 'HTML output' do
    it 'wraps ap output with plain <pre> tag' 


    it 'wraps ap output with <pre> tag with colorized <kbd>' 


    it 'wraps multiline ap output with <pre> tag with colorized <kbd>' 


    it 'wraps hash ap output with only an outer <pre> tag' 


    it 'encodes HTML entities (plain)' 


    it 'encodes HTML entities (color)' 

  end

  #------------------------------------------------------------------------------
  describe 'AwesomePrint.defaults' do
    after do
      AwesomePrint.defaults = nil
    end

    # See https://github.com/awesome-print/awesome_print/issues/98
    it 'should properly merge the defaults' 

  end

  #------------------------------------------------------------------------------
  describe 'Coexistence with the colorize gem' do
    before do # Redefine String#red just like colorize gem does it.
      @awesome_method = ''.method(:red)

      String.instance_eval do
        define_method :red do   # Method arity is now 0 in Ruby 1.9+.
          "[red]#{self}[/red]"
        end
      end
    end

    after do # Restore String#red method.
      awesome_method = @awesome_method
      String.instance_eval do
        define_method :red, awesome_method
      end
    end

    it 'shoud not raise ArgumentError when formatting HTML' 


    it 'shoud not raise ArgumentError when formatting HTML (shade color)' 


    it 'shoud not raise ArgumentError when formatting non-HTML' 


    it 'shoud not raise ArgumentError when formatting non-HTML (shade color)' 

  end

  #------------------------------------------------------------------------------
  describe 'Console' do
    it 'should detect IRB' 


    it 'should detect Pry' 


    it 'should detect Rails::Console' 


    it "should detect ENV['RAILS_ENV']" 


    it 'should return the actual object when *not* running under console' 


    it 'should return nil when running under console' 


    it 'handles NoMethodError on IRB implicit #ai' 

  end
end

