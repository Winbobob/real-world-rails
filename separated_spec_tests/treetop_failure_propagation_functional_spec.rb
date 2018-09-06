require 'spec_helper'

describe "An expression for braces surrounding zero or more letters followed by semicolons" do
  testing_expression "'{' ([a-z] ';')* '}'"
  
  it "parses matching input successfully" 

  
  it "fails to parse input with an expression that is missing a semicolon, reporting the terminal failure occurring at the maximum index" 

end

