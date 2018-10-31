require "spec_helper"

describe SafeYAML::Transform::ToInteger do
  it "returns true when the value matches a valid Integer" 


  it "returns false when the value does not match a valid Integer" 


  it "returns false when the value spans multiple lines" 


  it "allows commas in the number" 


  it "correctly parses numbers in octal format" 


  it "correctly parses numbers in hexadecimal format" 


  it "defaults to a string for a number that resembles octal format but is not" 


  it "correctly parses 0 in decimal" 


  it "defaults to a string for a number that resembles hexadecimal format but is not" 


  it "correctly parses all formats in the YAML spec" 


  # see https://github.com/dtao/safe_yaml/pull/51
  it "strips out underscores before parsing decimal values" 

end

