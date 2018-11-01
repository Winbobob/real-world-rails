require 'spec_helper'

describe 'Awspec::Generator::Spec::NetworkInterface' do
  before do
    Awspec::Stub.load 'network_interface'
  end
  let(:network_interface) { Awspec::Generator::Spec::NetworkInterface.new }
  it 'generate_by_vpc_id generate spec' 

end

