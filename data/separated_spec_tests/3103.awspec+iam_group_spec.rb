require 'spec_helper'

describe Awspec::Generator::Spec::IamGroup do
  before do
    Awspec::Stub.load 'iam_group'
  end
  let(:group) { Awspec::Generator::Spec::IamGroup.new }
  it 'generates spec' 

end

