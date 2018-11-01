require 'spec_helper'

describe 'Awspec::Generator::Spec::Vpc' do
  before do
    Awspec::Stub.load 'vpc'
  end
  let(:vpc) { Awspec::Generator::Spec::Vpc.new }
  it 'generate_by_vpc_id generate spec' 

end

