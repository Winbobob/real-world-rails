require 'spec_helper'

describe Awspec::Generator::Spec::Ebs do
  before do
    Awspec::Stub.load 'ebs'
  end
  let(:ebs) { Awspec::Generator::Spec::Ebs.new }
  it 'generates spec' 

end

