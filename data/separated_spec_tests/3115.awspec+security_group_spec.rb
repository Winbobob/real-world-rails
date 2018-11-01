require 'spec_helper'

describe 'Awspec::Generator::Spec::SecurityGroup' do
  before do
    Awspec::Stub.load 'security_group'
  end
  let(:security_group) { Awspec::Generator::Spec::SecurityGroup.new }
  it 'generate_by_vpc_id generate spec' 

end

