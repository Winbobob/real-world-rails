require 'rails_helper'

describe Location do
  let(:location) {
    Location.new(
      lat: BigDecimal.new('2.0'),
      lng: BigDecimal.new('3.0'),
      radius: 300,
      speed: 2,
      course: 30)
  }

  it "converts values to Float" 


  it "provides hash-style access to its properties with both symbol and string keys" 


  it "has a convenience accessor for combined latitude and longitude" 


  it "does not allow hash-style assignment" 


  it "ignores invalid values" 


  it "considers a location empty if either latitude or longitude is missing" 


  it "is droppable" 

end

