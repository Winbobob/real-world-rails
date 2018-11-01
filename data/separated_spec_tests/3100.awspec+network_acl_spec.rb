require 'spec_helper'

describe 'Awspec::Generator::Spec::NetworkAcl' do
  before do
    Awspec::Stub.load 'network_acl'
  end
  let(:network_acl) { Awspec::Generator::Spec::NetworkAcl.new }
  it 'generate_by_vpc_id generate spec' 

end

