require 'spec_helper'

describe Awspec::Generator::Spec::IamPolicy do
  before do
    Awspec::Stub.load 'iam_policy'
  end
  let(:policy) { Awspec::Generator::Spec::IamPolicy.new }
  it 'generates spec' 

end

