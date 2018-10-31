require_relative 'helper'
require "readline" unless defined?(Readline)
require "pry/input_completer"

def completer_test(bind, pry=nil, assert_flag=true)
  test = proc {|symbol|
    expect(Pry::InputCompleter.new(pry || Readline, pry).call(symbol[0..-2], target: Pry.binding_for(bind)).include?(symbol)).to eq(assert_flag)}
  return proc {|*symbols| symbols.each(&test) }
end


describe Pry::InputCompleter do
  before do
    # The AMQP gem has some classes like this:
    #  pry(main)> AMQP::Protocol::Test::ContentOk.name
    #  => :content_ok
    module SymbolyName
      def self.name; :symboly_name; end
    end

    @before_completer = Pry.config.completer
    Pry.config.completer = Pry::InputCompleter
  end

  after do
    Pry.config.completer = @before_completer
    Object.remove_const :SymbolyName
  end

  # another jruby hack :((
  if !Pry::Helpers::BaseHelpers.jruby?
    it "should not crash if there's a Module that has a symbolic name." 

  end

  it 'should take parenthesis and other characters into account for symbols' 


  it 'should complete instance variables' 



  it 'should complete for stdlib symbols' 


  it 'should complete for target symbols' 


  it 'should complete for arbitrary scopes' 


  it 'should complete for stdlib symbols' 


  it 'should complete for target symbols' 


  it 'should complete for arbitrary scopes' 


  it 'should not return nil in its output' 


  it 'completes expressions with all available methods' 


  it 'does not offer methods from blacklisted modules' 


  if !Pry::Helpers::BaseHelpers.jruby?
    # Classes that override .hash are still hashable in JRuby, for some reason.
    it 'ignores methods from modules that override Object#hash incompatibly' 

  end
end

