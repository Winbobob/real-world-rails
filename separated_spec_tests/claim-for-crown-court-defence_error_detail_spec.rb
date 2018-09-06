require 'rails_helper'

describe ErrorDetail do

  let(:ed0) { ErrorDetail.new(:key0,'long error',  'short error', 'api message') }
  let(:ed1) { ErrorDetail.new(:key3,'long error',  'short error', 'api message', 10) }
  let(:ed2) { ErrorDetail.new(:key2,'long error',  'short error', 'api message', 11) }
  let(:ed3) { ErrorDetail.new(:key1,'long error',  'short error', 'api message', 12) }
  let(:ed4) { ErrorDetail.new(:key1,'long error',  'short error', 'api message', 12) }
  let(:ed5) { ErrorDetail.new(:key1,'long error',  'different short error', 'api message', 12) }
  let(:ed6) { ErrorDetail.new(:key1,'different long error', 'short error', 'api message', 12) }
  let(:ed7) { ErrorDetail.new(:key1,'long error', 'short error', 'different api message', 12) }

  it 'stores attribute against a long message, short message and ordering sequence' 


  it 'defaults sequence to 99999' 


  it 'sorts against other ErrorDetail instances by sequence' 


  it 'compares all message attributes when testing for equality' 


end

