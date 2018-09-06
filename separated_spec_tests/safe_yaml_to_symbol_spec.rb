require "spec_helper"

describe SafeYAML::Transform::ToSymbol do
  def with_symbol_deserialization_value(value)
    symbol_deserialization_flag = SafeYAML::OPTIONS[:deserialize_symbols]
    SafeYAML::OPTIONS[:deserialize_symbols] = value

    yield

  ensure
    SafeYAML::OPTIONS[:deserialize_symbols] = symbol_deserialization_flag
  end

  def with_symbol_deserialization(&block)
    with_symbol_deserialization_value(true, &block)
  end

  def without_symbol_deserialization(&block)
    with_symbol_deserialization_value(false, &block)
  end

  it "returns true when the value matches a valid Symbol" 


  it "returns true when the value matches a valid String+Symbol" 


  it "returns true when the value matches a valid String+Symbol with 's" 


  it "returns true when the value has special characters and is wrapped in a String" 


  it "returns false when symbol deserialization is disabled" 


  it "returns false when the value does not match a valid Symbol" 


  it "returns false when the symbol does not begin the line" 

end

