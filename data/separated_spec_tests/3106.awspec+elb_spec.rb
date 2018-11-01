require 'spec_helper'

describe 'Awspec::Generator::Spec::Elb' do
  before do
    Awspec::Stub.load 'elb'
  end
  let(:elb) { Awspec::Generator::Spec::Elb.new }
  it 'generate_by_vpc_id generate spec' 

end

