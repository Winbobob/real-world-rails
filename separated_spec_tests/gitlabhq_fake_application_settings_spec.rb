require 'spec_helper'

describe Gitlab::FakeApplicationSettings do
  let(:defaults) { { password_authentication_enabled_for_web: false, foobar: 'asdf', signup_enabled: true, 'test?' => 123 } }

  subject { described_class.new(defaults) }

  it 'wraps OpenStruct variables properly' 


  it 'defines predicate methods' 


  it 'predicate method changes when value is updated' 


  it 'does not define a predicate method' 


  it 'does not override an existing predicate method' 

end

