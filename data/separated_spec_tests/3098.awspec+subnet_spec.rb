require 'spec_helper'

describe 'Awspec::Generator::Spec::Subnet' do
  before do
    Awspec::Stub.load 'subnet'
  end
  let(:subnet) { Awspec::Generator::Spec::Subnet.new }
  it 'generate_by_vpc_id generate spec' 

end

