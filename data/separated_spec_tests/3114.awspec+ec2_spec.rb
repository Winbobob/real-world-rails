require 'spec_helper'

describe 'Awspec::Generator::Spec::Ec2' do
  before do
    Awspec::Stub.load 'ec2'
  end
  let(:ec2) { Awspec::Generator::Spec::Ec2.new }
  it 'generate_by_vpc_id generate spec' 

end

