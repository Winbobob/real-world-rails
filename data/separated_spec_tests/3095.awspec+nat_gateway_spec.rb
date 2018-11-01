require 'spec_helper'

describe 'Awspec::Generator::Spec::NatGateway' do
  before do
    Awspec::Stub.load 'nat_gateway'
  end
  let(:nat_gateway) { Awspec::Generator::Spec::NatGateway.new }
  it 'generate_by_vpc_id generate spec' 

end

