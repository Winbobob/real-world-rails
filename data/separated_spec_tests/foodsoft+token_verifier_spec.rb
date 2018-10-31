require_relative '../spec_helper'

describe TokenVerifier do
  let (:prefix) { 'xyz' }
  let (:v) { TokenVerifier.new(prefix) }
  let (:msg) { v.generate }

  it 'validates' 


  it 'validates when recreated' 


  it 'does not validate with a different prefix' 


  it 'does not validate in a different foodcoop scope' 


  it 'does not validate a random string' 


  it 'returns the message' 


end

