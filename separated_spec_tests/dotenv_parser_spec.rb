require "spec_helper"

describe Dotenv::Parser do
  def env(string)
    Dotenv::Parser.call(string, true)
  end

  it "parses unquoted values" 


  it "parses values with spaces around equal sign" 


  it "parses values with leading spaces" 


  it "parses values with following spaces" 


  it "parses double quoted values" 


  it "parses double quoted values with following spaces" 


  it "parses single quoted values" 


  it "parses single quoted values with following spaces" 


  it "parses escaped double quotes" 


  it "parses empty values" 


  it "expands variables found in values" 


  it "parses variables wrapped in brackets" 


  it "expands variables from ENV if not found in .env" 


  it "expands variables from ENV if found in .env during load" 


  it "doesn't expand variables from ENV if in local env in overload" 


  it "expands undefined variables to an empty string" 


  it "expands variables in double quoted strings" 


  it "does not expand variables in single quoted strings" 


  it "does not expand escaped variables" 


  it "parses yaml style options" 


  it "parses export keyword" 


  it "allows export line if you want to do it that way" 


  it "allows export line if you want to do it that way and checks for unset"\
     " variables" do
    expect do
      env('OPTION_A=2
export OH_NO_NOT_SET')
    end.to raise_error(Dotenv::FormatError, 'Line "export OH_NO_NOT_SET"'\
                                            " has an unset variable")
  end

  it "expands newlines in quoted strings" 


  it 'parses variables with "." in the name' 


  it "strips unquoted values" 


  it "ignores lines that are not variable assignments" 


  it "ignores empty lines" 


  it "ignores inline comments" 


  it "allows # in quoted value" 


  it "ignores comment lines" 


  it "ignores commented out variables" 


  it "ignores comment" 


  it "parses # in quoted values" 


  it "parses # in quoted values with following spaces" 


  it "parses empty values" 


  if RUBY_VERSION > "1.8.7"
    it "parses shell commands interpolated in $()" 


    it "allows balanced parentheses within interpolated shell commands" 


    it "doesn't interpolate shell commands when escape says not to" 


    it "is not thrown off by quotes in interpolated shell commands" 


    it "supports carriage return" 


    it "supports carriage return combine with new line" 


    it "expands carriage return in quoted strings" 


    it "escape $ properly when no alphabets/numbers/_  are followed by it" 


    # echo bar $ -> prints bar $ in the shell
    it "ignore $ when it is not escaped and no variable is followed by it" 


    # This functionality is not supported on JRuby or Rubinius
    if (!defined?(RUBY_ENGINE) || RUBY_ENGINE != "jruby") &&
       !defined?(Rubinius)
      it "substitutes shell variables within interpolated shell commands" 

    end
  end
end

