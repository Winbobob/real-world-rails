require 'spec_helper'

describe Awspec::Generator::Spec::IamUser do
  before do
    Awspec::Stub.load 'iam_user'
  end
  let(:user) { Awspec::Generator::Spec::IamUser.new }
  it 'generates spec' 

end

