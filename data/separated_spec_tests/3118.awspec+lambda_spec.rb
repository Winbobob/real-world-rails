require 'spec_helper'

describe Awspec::Generator::Spec::Lambda do
  before do
    Awspec::Stub.load 'lambda'
  end
  let(:lambda) { Awspec::Generator::Spec::Lambda.new }
  it 'generates spec' 

end

