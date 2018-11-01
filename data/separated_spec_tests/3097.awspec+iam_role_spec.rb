require 'spec_helper'

describe Awspec::Generator::Spec::IamRole do
  before do
    Awspec::Stub.load 'iam_role'
  end
  let(:role) { Awspec::Generator::Spec::IamRole.new }
  it 'generates spec' 

end

